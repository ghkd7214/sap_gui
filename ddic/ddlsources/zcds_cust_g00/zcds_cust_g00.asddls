@AbapCatalog.sqlViewName: 'ZCDSCUSTG00'
@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Customer'
@Metadata.ignorePropagatedAnnotations: true
@OData.publish: true
@Metadata.allowExtensions: true
@Search.searchable: true

define view zcds_cust_g00 as select from scustom
    association[1..1] to zvh_country_g00 as _Country
        on $projection.Country = _Country.Country
    association[*] to zcds_book_g00 as _Booking
        on $projection.Id = _Booking.Customid
{
    @UI.selectionField: [{position: 10}]
    key id as Id,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    name as Name,
    form as Form,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    street as Street,
    postbox as Postbox,
    postcode as Postcode,
    @UI.selectionField: [{position: 20}]
    city as City,
    @UI.selectionField: [{position: 30}]
    @Consumption.valueHelp: '_Country'
    country as Country,
    telephone as Telephone,
    custtype as Custtype,
    discount as Discount,
//  Assocation Expose
    _Country,
    _Booking
}
