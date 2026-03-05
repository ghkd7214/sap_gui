@AbapCatalog.sqlViewName: 'YCDSUX403FLTG00'
@EndUserText.label: 'UX403 Searching and Filtering'
@UI.headerInfo.typeNamePlural: 'Sales Orders'
define view ycds_ex8_g00 as select from SEPM_I_SalesOrder
{
   @UI.lineItem.position: 10
   key SalesOrder as SalesOrderID,
   @UI.lineItem.position: 20
   _Customer.BusinessPartner as CustomerID,
   @UI.lineItem.position: 30
   _Customer.CompanyName as CustomerName,
    @UI.lineItem.position: 40
   _Customer.URL as CustomerURL,
    @UI.lineItem.position: 50
   _Customer.EmailAddress as CustomerEmailAddress,
   @UI.lineItem.position: 60
   cast( left(cast(CreationDateTime as abap.char( 30 )),8)as abap.dats ) as CreationDate
}
