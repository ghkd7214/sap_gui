@AbapCatalog.sqlViewName: 'ZEXOBJCHART2G07'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '오브젝트 페이지 차트2 전용'
@Metadata.ignorePropagatedAnnotations: true

@UI.chart: [{
    title: 'Numbers & Amount by Class',
    chartType: #COLUMN_DUAL,
    dimensions: [ 'Class' ],
    measures: [ 'TotalAmount', 'BookingCount' ]
}]

define view ZEX_OBJ_CHART2_G07 
  as select from sbook 
{
    key carrid as Carrid,
    key connid as Connid,
    class as Class,

    @DefaultAggregation: #SUM
    @UI.lineItem: [{ label: 'Booking Count' }] 
    count(*) as BookingCount,

    @Semantics.amount.currencyCode: 'Currency'
    @DefaultAggregation: #SUM
    @UI.lineItem.label: 'Total Amount'
    sum(loccuram) as TotalAmount,
    
    @UI.lineItem.label: '통화'
    @UI.hidden: true
    loccurkey as Currency
} 
where cancelled <> 'X'
group by carrid, connid, class, loccurkey
