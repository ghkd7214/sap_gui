@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exam Flight List'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_SFLIGHT_G21 as select from sflight
{
    @UI.lineItem: [{ position : 10 }]
    key carrid as Carrid,
    @UI.lineItem: [{ position : 20 }]
    key connid as Connid,
    @UI.lineItem: [{ position : 30 }]
    key fldate as Fldate,
    @UI.lineItem: [{ position : 40 }]
    @Semantics.amount.currencyCode: 'Currency'
    price as Price,
    @UI.lineItem: [{ position : 50 }]
    @UI.hidden: true
    currency as Currency,
    @UI.lineItem: [{ position : 60 }]
    planetype as Planetype,
    @UI.lineItem: [{ position : 70 }]
    seatsmax + seatsmax_b + seatsmax_f as Seatsmax,
    @UI.lineItem: [{ position : 80 }]
    seatsocc + seatsocc_b + seatsocc_f as Seatsocc,
    @UI.lineItem: [{ position : 90 }]
    seatsmax - seatsocc as Seatsfree,
    @UI.lineItem: [{ position : 100, type: #AS_DATAPOINT }]
    @UI.dataPoint: { targetValue: 20, visualization: #PROGRESS }
    division(seatsocc * 100 , seatsmax, 2) as SeatsRate
}
