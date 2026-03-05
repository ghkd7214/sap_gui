@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking customer'
@Metadata.ignorePropagatedAnnotations: true
define view entity zddl_book_cust_g00
//  with parameters 
////    p_int: abap.int1,
//    p_smk: abap.curr( 15, 2 ),
//    p_non: abap.curr( 15, 2 )
  as select from sbook
  association to scustom as _Customer
  //    on sbook.customid = _Customer.id
  on $projection.Customid = _Customer.id
{
  key sbook.carrid   as Carrid,
  key sbook.connid   as Connid,
  key sbook.fldate   as Fldate,
  key sbook.bookid   as Bookid,
      sbook.customid as Customid,
      //    customid,
      sbook.custtype as Custtype,
      sbook.smoker   as Smoker,

      //    case smoker when 'X' then 'Smoker'
      //                when ' ' then 'Non Smoker'
      //        end as Stext,

      case when smoker = 'X' then 'Smoker'
           when smoker = ' ' then 'Non Smoker'
           else 'Unknown'
           end       as Stext,

      @Semantics.amount.currencyCode: 'loccurkey'
      loccuram * 2   as double_price,
      loccurkey,
      
//      100 * $parameters.p_int as cal_price,
      

      
      10 + 2 * 5 as Calc,
      
      1.5 * 2.0 as fltp,

      @Semantics.amount.currencyCode: 'loccurkey'
      cast( loccuram as abap.fltp ) / cast( 2 as abap.fltp )  as half_price,

//      case smoker
//        when 'X' then sbook.loccuram * $parameters.p_smk
//                 else loccuram * $parameters.p_non
//      end as adj_price,

      //   Exposed.
      _Customer
}
