@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exam Chart 1'
@Metadata.ignorePropagatedAnnotations: true
@UI.chart: [{ title: 'Airline Year & Month Total Sum',
              chartType: #COLUMN_STACKED,
              dimensions: [ 'Fldate2' ],
              measures: [ 'Paymentsum' ] }]
define view entity ZEX_AMOUNT_G21 as select from sflight
{
    key carrid as Carrid,
    key connid as Connid,
    key fldate as Fldate,
    @Semantics.amount.currencyCode: 'Currency'
    price as Price,
    currency as Currency,
    @Semantics.amount.currencyCode: 'Currency'
    @DefaultAggregation: #SUM
    paymentsum as Paymentsum,
    substring( fldate, 1, 6 ) as Fldate2
}
