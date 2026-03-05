@EndUserText.label: 'EPM Demo: Business Partner' -- put the label into the first line
@Analytics.dataCategory: #DIMENSION              -- view is available for analytics with analytics engine as dimension view
@Analytics.dataExtraction.enabled: true          -- this view is a good candidate for extraction of data for a data warehouse
//@VDM.viewType:#BASIC                           -- this would mark a BASIC view in the Virtual Data Model (VDM)
@AccessControl.authorizationCheck: #NOT_REQUIRED -- a separate DCL definition is needed for instance based authorization checks
@AbapCatalog.sqlViewName: 'SEPM_IBUPA'           -- for technical reasons, a name for the generated SQL view is needed
@ObjectModel.representativeKey: 'BusinessPartnerUUID'  -- the most significant key field, anchor of foreign key associations pointing here
@ObjectModel.compositionRoot: true
@ObjectModel.semanticKey:  [ 'BusinessPartner' ]

@ObjectModel.usageType.serviceQuality:#C
@ObjectModel.usageType.sizeCategory:#XL
@ObjectModel.usageType.dataClass: #TRANSACTIONAL

define view SEPM_I_BusinessPartner               -- CDS view name; prefix "I_" indicates that it is a VDM interface view (released for reuse)
  as select from snwd_bpa                        -- the business partner table is the data source for this view

  association [0..1] to SEPM_I_BusinessPartnerRole as _Role                                                                             -- definition of the association "_Role" to the business partner role view
                                                                         on $projection.BusinessPartnerRole = _Role.BusinessPartnerRole -- join condition for the association, defined on the projection list ($projection) of
                                                                                                                                        -- this business partner view and the associated business partner role view (via _Role)
  association [0..1] to SEPM_I_Currency            as _Currency          on $projection.Currency = _Currency.Currency
  association [0..1] to SEPM_I_Address             as _Address           on $projection.AddressUUID = _Address.AddressUUID
  association [0..*] to SEPM_I_ContactPerson       as _ContactPerson     on $projection.BusinessPartnerUUID = _ContactPerson.BusinessPartnerUUID
  association [0..1] to SEPM_I_BUPAAPPROVALSTATUS  as _ApprovalStatus    on $projection.BuPaApprovalStatus = _ApprovalStatus.BuPaApprovalStatus
  association [0..1] to SEPM_I_Employee            as _CreatedByUser     on $projection.CreatedByUser = _CreatedByUser.EmployeeUUID
  association [0..1] to SEPM_I_Employee            as _LastChangedByUser on $projection.LastChangedByUser = _LastChangedByUser.EmployeeUUID
  association [1..1] to SEPM_E_BusinessPartner     as _Extension         on snwd_bpa.node_key = _Extension.BusinessPartnerUUID //Association for extensibility aka Extension Associationtolerate the warning!

{
  key cast( snwd_bpa.node_key as sepm_bp_uuid preserving type ) as BusinessPartnerUUID, -- cast needed to a data element with appropriate labels for a business partner UUID
      -- "key" indicates that this field uniquely identifies a row; needed e.g. for analytics
      @ObjectModel.readOnly: true
      @ObjectModel.text.element: [ 'CompanyName' ]
      snwd_bpa.bp_id                                            as BusinessPartner,

      @ObjectModel.foreignKey.association: '_Role' -- foreign key association of this field, also used for basic value help
      snwd_bpa.bp_role                                          as BusinessPartnerRole,

      @Semantics.currencyCode: true
      @ObjectModel.foreignKey.association: '_Currency'
      snwd_bpa.currency_code                                    as Currency,

      @Semantics.text: true
      snwd_bpa.company_name                                     as CompanyName,

      @Semantics.text: true
      snwd_bpa.legal_form                                       as LegalForm,

      @ObjectModel.foreignKey.association: '_Address'
      snwd_bpa.address_guid                                     as AddressUUID,

      @Semantics.eMail.address: true
      snwd_bpa.email_address                                    as EmailAddress,

      @Semantics.telephone.type:  [ #FAX ]
      snwd_bpa.fax_number                                       as FaxNumber,

      @Semantics.telephone.type:  [ #PREF ]
      snwd_bpa.phone_number                                     as PhoneNumber,

      snwd_bpa.web_address                                      as URL,

      @ObjectModel.foreignKey.association: '_CreatedByUser'
      @ObjectModel.readOnly: true
      created_by                                                as CreatedByUser,

      @ObjectModel.readOnly: true
      @Semantics.systemDateTime.createdAt: true
      created_at                                                as CreationDateTime,

      @ObjectModel.readOnly: true
      @ObjectModel.foreignKey.association: '_LastChangedByUser'
      changed_by                                                as LastChangedByUser,

      @ObjectModel.readOnly: true
      @Semantics.systemDateTime.lastChangedAt: true
      changed_at                                                as LastChangedDateTime,

      approval_status                                           as BuPaApprovalStatus,


      _Role, -- expose association "_Role" to consumers of this view
      _Currency,
      _Address,
      _CreatedByUser,
      _LastChangedByUser,
      @ObjectModel.association.type:  [ #TO_COMPOSITION_CHILD ]
      _ContactPerson,
      _ApprovalStatus
}
