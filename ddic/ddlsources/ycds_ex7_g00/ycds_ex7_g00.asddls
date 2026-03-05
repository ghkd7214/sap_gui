@AbapCatalog.sqlViewName: 'YCDSUX403LISTG00'
@EndUserText.label: 'UX403 Basic List Report'
define view ycds_ex7_g00 as select from SEPM_I_SalesOrder
{
   key SalesOrder as SalesOrderID,
   _Customer.BusinessPartner as CustomerID,
   _Customer.CompanyName as CustomerName,
   GrossAmountInTransacCurrency as GrossAmount,
   NetAmountInTransactionCurrency as NetAmount,
   GrossAmountInTransacCurrency - NetAmountInTransactionCurrency as TaxAmount,
   TransactionCurrency as Currency
}
