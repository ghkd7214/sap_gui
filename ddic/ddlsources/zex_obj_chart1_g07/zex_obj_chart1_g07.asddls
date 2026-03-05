@AbapCatalog.sqlViewName: 'ZEXOBJCHART1G07'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '오브젝트 페이지 차트1 전용'
@Metadata.ignorePropagatedAnnotations: true

@UI.chart: [{ 
    title: 'Airline Year & Month Total Sum',
    chartType: #COLUMN,
    dimensions: [ 'SYear', 'SMonth' ],
    measures: [ 'Paymentsum' ] 
}]

define view ZEX_OBJ_CHART1_G07 as select from sflight
{   
    key carrid as Carrid,
    key connid as Connid,
    key fldate as Fldate,

    @UI.lineItem.label: 'Year'
    substring( fldate, 1, 4 ) as SYear,

    @UI.lineItem.label: 'Month'
    concat( substring( fldate, 5, 2 ), ' 월' ) as SMonth,

    currency as Currency,

    @Semantics.amount.currencyCode: 'Currency'
    @DefaultAggregation: #SUM
    paymentsum as Paymentsum
}
