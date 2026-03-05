@AbapCatalog.sqlViewName: 'ZCDSCHARTG07'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Chart'
@Metadata.ignorePropagatedAnnotations: true

@UI.chart: [
    { title: 'Total Airlie Booking Count',
      description: 'Airlien per Booking Count',
      chartType: #COLUMN_STACKED,   // 차트타입
      dimensions: [ 'Carrid' ],
      measures: [ 'Total' ]  }
]
define view ZCDS_CHART_G07 as select from sbook
{
    key customid as Customid,
        carrid as Carrid,
    @DefaultAggregation: #SUM
    cast(  1  as abap.int4 ) as Total
}
