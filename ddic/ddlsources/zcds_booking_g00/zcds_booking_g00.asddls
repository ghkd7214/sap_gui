@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_booking_g00 
    with parameters 
        p_int: abap.int4,
        p_smk: abap.dec( 15, 2 ),
        p_non: abap.dec( 15, 2 )
as select from sbook
{
    key carrid as Carrid,
    key connid as Connid,
    key fldate as Fldate,
    key bookid as Bookid,
    customid as Customid,
    custtype as Custtype,
    smoker as Smoker,
    @Semantics.amount.currencyCode: 'Loccurkey'
    loccuram as Loccuram,
    loccurkey as Loccurkey,
    
    cast( 100 as abap.int4 ) * $parameters.p_int as calc,
    
//    @Semantics.amount.currencyCode: 'Currcode'
    case smoker when 'X'
      then cast(loccuram as abap.dec( 15, 2 )) * $parameters.p_smk
      else cast(loccuram as abap.dec( 15, 2 )) * $parameters.p_non
    end as adj_amount
//    
//    cast('USD' as abap.cuky) as Currcode

}
