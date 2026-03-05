@AbapCatalog.sqlViewName: 'ZCDSUX403FLTG21'
@EndUserText.label: 'UX403 Searching and Filtering'
@UI.headerInfo.typeNamePlural: 'Sales Orders'
@OData.publish: true
define view ZCDS_EX8_G21 as select from SEPM_I_SalesOrder
    association[1..1] to ZVH_CUSTOMER_G21 as _CustomerVH
        on $projection.CustomerID = _CustomerVH.CustomerID
{
   @UI.lineItem.position: 10
   key SalesOrder as SalesOrderID,
   @UI.lineItem.position: 20
   @UI.selectionField: [{ position : 10 }]
   @Consumption.valueHelp: '_CustomerVH'
   _Customer.BusinessPartner as CustomerID,
   @UI.lineItem.position: 30
   _Customer.CompanyName as CustomerName,
    @UI.lineItem.position: 40
   _Customer.URL as CustomerURL,
    @UI.lineItem.position: 50
   _Customer.EmailAddress as CustomerEmailAddress,
   @UI.lineItem.position: 60
   @UI.selectionField: [{ position : 20 }]
   cast( left(cast(CreationDateTime as abap.char( 30 )),8)as abap.dats ) as CreationDate,
   _CustomerVH
}
