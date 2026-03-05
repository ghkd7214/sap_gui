@AbapCatalog.sqlViewName: 'YCDSCHARTG00'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Chart'
@Metadata.ignorePropagatedAnnotations: true

@UI.chart: [
    { title: 'Total Airlie Booking Count',
      description: 'Airlien per Booking Count',
      chartType: #COLUMN_STACKED,
      dimensions: [ 'Carrid' ],
      measures: [ 'Total' ]  }
]
define view ycds_chart_g00 as select from sbook
{
    key customid as Customid,
        carrid as Carrid,
    @DefaultAggregation: #SUM
    cast(  1  as abap.int4 ) as Total
}
