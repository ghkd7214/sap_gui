@AbapCatalog.sqlViewName: 'ZCDSUX403LISTG07'
@EndUserText.label: 'UX403 Basic List Report'
@OData.publish: true
@Metadata.allowExtensions: true
define view ZCDS_EX7_G07 as select from SEPM_I_SalesOrder
{
   key SalesOrder as SalesOrderID,
   _Customer.BusinessPartner as CustomerID,
   _Customer.CompanyName as CustomerName,
   GrossAmountInTransacCurrency as GrossAmount,
   NetAmountInTransactionCurrency as NetAmount,
   @Semantics.amount.currencyCode: 'Currency'
   GrossAmountInTransacCurrency - NetAmountInTransactionCurrency as TaxAmount,
   @Semantics.currencyCode: true
   TransactionCurrency as Currency
}
