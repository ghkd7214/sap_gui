@AbapCatalog.sqlViewName: 'ZCDSUX403METAG07'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '엑서사이즈 6'
@Metadata.ignorePropagatedAnnotations: true
@OData.publish: true
@Metadata.allowExtensions: true
define view ZCDS_UX403_META_G07 as select from SEPM_I_SalesOrder
{
  key SalesOrder as SalesOrderID,
  _Customer.BusinessPartner as CustomerID,
  _Customer.CompanyName as CompanyName,
  GrossAmountInTransacCurrency as GrossAmount 
}
