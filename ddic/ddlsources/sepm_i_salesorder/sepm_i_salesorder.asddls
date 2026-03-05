@EndUserText.label: 'EPM Demo: Sales Order'
@ObjectModel.compositionRoot: true
@Analytics:{ dataCategory:#DIMENSION , dataExtraction.enabled:true }
@AccessControl.authorizationCheck: #NOT_REQUIRED
//@VDM.viewType:#BASIC
@AbapCatalog.sqlViewName: 'SEPM_ISO'
@ObjectModel.representativeKey: 'SalesOrderUUID'
@ObjectModel.semanticKey:  [ 'SalesOrder' ] 

@ObjectModel.usageType.serviceQuality:#C
@ObjectModel.usageType.sizeCategory:#L
@ObjectModel.usageType.dataClass: #TRANSACTIONAL


define view SEPM_I_SalesOrder
  as select from snwd_so
  
  association [0..1] to SEPM_I_Currency                 as _TransactionCurrency on $projection.TransactionCurrency       = _TransactionCurrency.Currency
  association [0..1] to SEPM_I_ShortTextGroup           as _ShortTextGroup      on $projection.ShortTextGroupUUID        = _ShortTextGroup.ShortTextGroupUUID
  association [0..1] to SEPM_I_BusinessPartner          as _Customer            on $projection.CustomerUUID              = _Customer.BusinessPartnerUUID
  association [0..1] to SEPM_I_CUSTOMER                 as _CustomerV2          on $projection.CustomerUUID              = _CustomerV2.CustomerUUID
  association [0..1] to SEPM_I_SlsOrdLifeCycleStatus    as _LifeCycleStatus     on $projection.SalesOrderLifeCycleStatus = _LifeCycleStatus.SalesOrderLifeCycleStatus
  association [0..1] to SEPM_I_SalesOrderBillingStatus  as _BillingStatus       on $projection.SalesOrderBillingStatus   = _BillingStatus.SalesOrderBillingStatus
  association [0..1] to SEPM_I_SlsOrdDeliveryStatus     as _DeliveryStatus      on $projection.SalesOrderDeliveryStatus  = _DeliveryStatus.SalesOrderDeliveryStatus
  association [0..1] to Sepm_I_SalesOrdOverallStatus    as _OverallStatus       on $projection.SalesOrderOverallStatus   = _OverallStatus.SalesOrderOverallStatus
  association [0..1] to Sepm_I_SlsordPaymentMethod      as _PaymentMethod       on $projection.SalesOrderPaymentMethod   = _PaymentMethod.SalesOrderPaymentMethod 
  association [0..1] to Sepm_I_SlsordPaymentTerms       as _PaymentTerms        on $projection.SalesOrderPaymentTerms    = _PaymentTerms.SalesOrderPaymentTerms
  association [0..*] to SEPM_I_SalesOrderItem           as _Item                on $projection.SalesOrderUUID            = _Item.SalesOrderUUID
  association [0..1] to SEPM_I_Employee                 as _CreatedByUser       on $projection.CreatedByUser             = _CreatedByUser.EmployeeUUID
  association [0..1] to SEPM_I_Employee                 as _LastChangedByUser   on $projection.LastChangedByUser         = _LastChangedByUser.EmployeeUUID 
  association [1..1] to SEPM_E_SalesOrder               as _Extension           on snwd_so.node_key                      = _Extension.SalesOrderUUID     // Extension Association tolerate the warning!     
  association [0..1] to SEPM_I_ContactPerson            as _CustomerContact     on $projection.CustomerContactUUID       = _CustomerContact.ContactPersonUUID 

  association [0..1] to SEPM_I_PartyAddress as _ShipToPartyAddress 
     on $projection.ShipToPartyAddressUUID = _ShipToPartyAddress.PartyAddressUUID                                                                
  association [0..1] to SEPM_I_PartyAddress as _BillToPartyAddress         
     on $projection.BillToPartyAddressUUID = _BillToPartyAddress.PartyAddressUUID
{ 
  key cast ( node_key as sepm_so_uuid preserving type ) as SalesOrderUUID,
  
  @ObjectModel.readOnly: true
  so_id as SalesOrder,
  
  @ObjectModel.readOnly: true
  created_by as CreatedByUser, 
  
  @ObjectModel.readOnly: true
  @Semantics.systemDateTime.createdAt: true
  created_at as CreationDateTime,
  
  @ObjectModel.readOnly: true
  changed_by as LastChangedByUser, 
  
  @ObjectModel.readOnly: true
  @Semantics.systemDateTime.lastChangedAt: true
  changed_at as LastChangedDateTime,  
  
  created_by_bp as IsCreatedByBusinessPartner,
  changed_by_bp as IsLastChangedByBusinessPartner,
  note_guid     as ShortTextGroupUUID, 
  
  @ObjectModel.foreignKey.association: '_Customer'
  buyer_guid    as CustomerUUID, 
  
  @Semantics.currencyCode: true
  @ObjectModel.foreignKey.association: '_TransactionCurrency'
  currency_code as TransactionCurrency,
  
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  @DefaultAggregation: #SUM
  gross_amount as GrossAmountInTransacCurrency,
  
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  @DefaultAggregation: #SUM
  net_amount as NetAmountInTransactionCurrency,
  
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  @DefaultAggregation: #SUM
  tax_amount as TaxAmountInTransactionCurrency,
  
  @ObjectModel.foreignKey.association: '_LifeCycleStatus'
  lifecycle_status as SalesOrderLifeCycleStatus, 
  
  @ObjectModel.foreignKey.association: '_BillingStatus'
  billing_status   as SalesOrderBillingStatus, 
  
  @ObjectModel.foreignKey.association: '_DeliveryStatus'
  delivery_status  as SalesOrderDeliveryStatus, 
  
  @ObjectModel.foreignKey.association: '_OverallStatus'
  overall_status   as SalesOrderOverallStatus,
  op_id as Opportunity,
  
  @ObjectModel.foreignKey.association: '_CustomerContact'
  buy_contact_guid  as CustomerContactUUID,
  
  @ObjectModel.foreignKey.association: '_ShipToPartyAddress'
  ship_to_adr_guid  as ShipToPartyAddressUUID, 
  
  @ObjectModel.foreignKey.association: '_BillToPartyAddress'
  bill_to_adr_guid  as BillToPartyAddressUUID, 
  
  @ObjectModel.foreignKey.association: '_PaymentMethod'
  payment_method    as SalesOrderPaymentMethod,
  
  @ObjectModel.foreignKey.association: '_PaymentTerms'
  payment_terms     as SalesOrderPaymentTerms,    
   
  _TransactionCurrency,
  @ObjectModel.association.type:  [ #TO_COMPOSITION_CHILD ] 
  _Item,
  _Customer,
  _CustomerV2,
  _ShortTextGroup,
  _DeliveryStatus,
  _BillingStatus,
  _CreatedByUser,
  _LastChangedByUser,
  _LifeCycleStatus,
  _OverallStatus , 
  _CustomerContact, 
  _ShipToPartyAddress,
  _BillToPartyAddress,
  _PaymentMethod,  
  _PaymentTerms
}
   
  
  
  
  
  
 