@AbapCatalog.sqlViewName: 'ZEXOBJSFLIGHTG07'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '오브젝트 페이지 테이블 전용'
@Metadata.ignorePropagatedAnnotations: true
define view ZEX_OBJ_SFLIGHT_G07 as select from sflight
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
    
    @UI.lineItem: [{ position : 60, label: 'Plane Type' }]
    planetype as Planetype,
    
    @UI.lineItem: [{ position : 70, label: 'Total Maximum Seats' }]
    seatsmax + seatsmax_b + seatsmax_f as Seatsmax,
    
    @UI.lineItem: [{ position : 80, label: 'Total Occupied Seats' }]
    seatsocc + seatsocc_b + seatsocc_f as Seatsocc,
    
    @UI.lineItem: [{ position : 90, label: 'Total Free Seats' }]
    seatsmax - seatsocc as Seatsfree,
    
    @UI: { lineItem: [{ position : 100, type: #AS_DATAPOINT, label: 'Rate' }],
          dataPoint: [{ targetValue: 100, visualization: #PROGRESS }] }
    division(seatsocc * 100 , seatsmax, 2) as OccupancyRate
}
