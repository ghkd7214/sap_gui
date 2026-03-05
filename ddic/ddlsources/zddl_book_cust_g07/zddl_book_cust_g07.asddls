@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'book_cust_g07'
@Metadata.ignorePropagatedAnnotations: true
define view entity zddl_book_cust_g07
//  with parameters
//    p_int : abap.int4,
//    p_smk : abap.dec( 15, 2 ),
//    p_non : abap.dec( 15, 2 )
  as select from sbook
  association to scustom as _Customer
  //on sbook.customid = _Customer.id
  on $projection.Customid = _Customer.id
{
  key sbook.carrid                                           as Carrid,
  key sbook.connid                                           as Connid,
  key sbook.fldate                                           as Fldate,
  key sbook.bookid                                           as Bookid,
      sbook.customid                                         as Customid,
      sbook.custtype                                         as Custtype,
      sbook.smoker                                           as Smoker,

      case smoker when  'X' then 'Smoker'
                  when  ' ' then 'Non Smoker'
      end                                                    as Stext,

      @Semantics.amount.currencyCode: 'loccurkey'
      loccuram * 2                                           as double_price,
      loccurkey,

      1.5 * 2.0                                              as fltp,

      @Semantics.amount.currencyCode: 'loccurkey'
      cast( loccuram as abap.fltp ) / cast( 2 as abap.fltp ) as half_price,

//      cast( 100 as abap.int4 ) * $parameters.p_int           as calc,

      //    @Semantics.amount.currencyCode: 'Currcode'
//      case smoker when 'X'
//        then cast(loccuram as abap.dec( 15, 2 )) * $parameters.p_smk
//        else cast(loccuram as abap.dec( 15, 2 )) * $parameters.p_non
//      end                                                    as adj_amount,


      //Exposed
      _Customer
}
