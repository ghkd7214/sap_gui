@AbapCatalog.sqlViewName: 'ZCDSUX403G07'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SalesOrder CDS View'
@OData.publish: true
@Metadata.ignorePropagatedAnnotations: true
define view zcds_ux403_g07 as select from SEPM_I_SalesOrder
{
  @UI.lineItem: [{ position: 10 }]
  key SalesOrder as SalesOrderID,
  @UI.lineItem: [{ position: 20 }]
  _Customer.BusinessPartner as CustomerID,
  @UI.lineItem: [{ position: 30 }]
  _Customer.CompanyName as CompanyName,
  @UI.lineItem: [{ position: 40 }]
  GrossAmountInTransacCurrency as GrossAmount
}
