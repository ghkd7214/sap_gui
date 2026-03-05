@AbapCatalog.sqlViewName: 'ZD750AW_SQL1_G07'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZD750AW_DDL1_G07'

@ClientDependent: true
 
define view ZD750AW_DDL1_G07 as select from sbook as sb
inner join scustom as sc on sb.customid = sc.id 
{
  key sb.carrid,
  key sb.connid,
  key sb.fldate,
  key sb.bookid,
      sb.customid,
      sc.form,
      sc.name,
      sb.order_date,
      
      @Semantics.amount.currencyCode: 'sb.currency'
      sb.loccuram,
      
      @Semantics.currencyCode: true
      sb.loccurkey as currency
}
