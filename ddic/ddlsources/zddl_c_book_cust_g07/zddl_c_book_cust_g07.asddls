@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'booking cumtomer'
@Metadata.ignorePropagatedAnnotations: true
define view entity zddl_c_book_cust_g07 as select from zddl_book_cust_g07
{
    key Carrid,
    key Connid,
    key Fldate,
    key Bookid,
    Customid,
    Custtype,
    Smoker,
    _Customer.name,
    _Customer.city,
    _Customer.telephone,
    /* Associations */
    _Customer
}
