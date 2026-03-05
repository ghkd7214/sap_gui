@AbapCatalog.sqlViewName: 'ZCDSBOOKG00'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Booking'
@Metadata.ignorePropagatedAnnotations: true
define view zcds_book_g00 as select from sbook
{
    @UI.lineItem: [{ position: 10 }]
    key carrid as Carrid,
    @UI.lineItem: [{ position: 20 }]
    key connid as Connid,
    @UI.lineItem: [{ position: 30 }]
    key fldate as Fldate,
    @UI.lineItem: [{ position: 40 }]
    key bookid as Bookid,
    @UI.lineItem: [{ position: 50 }]
    customid as Customid,
    @UI.lineItem: [{ position: 60 }]
    custtype as Custtype,
    @UI.lineItem: [{ position: 70 }]
    smoker as Smoker,
    @UI.lineItem: [{ position: 80 }]
    @Semantics.quantity.unitOfMeasure: 'Wunit'
    luggweight as Luggweight,
    @UI.hidden: true
    @Semantics.unitOfMeasure: true
    wunit as Wunit,
    @UI.lineItem: [{ position: 90 }]
    invoice as Invoice,
    @UI.lineItem: [{ position: 100 }]
    class as Class,
//    loccuram as Loccuram,
//    loccurkey as Loccurkey,
//    order_date as OrderDate,
//    agencynum as Agencynum,
    @UI.lineItem: [{ position: 110 }]
    cancelled as Cancelled
}
