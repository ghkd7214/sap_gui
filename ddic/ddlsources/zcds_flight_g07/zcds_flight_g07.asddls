@AbapCatalog.sqlViewName: 'ZCDSFLIGHTG07'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight CDS View'
@Metadata.ignorePropagatedAnnotations: true
@OData.publish: true
@Metadata.allowExtensions: true
define view zcds_flight_g07 as select from /dmo/flight
{
  key carrier_id as CarrierId,
  key connection_id as ConnectionId,
  key flight_date as FlightDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  price as Price,
  @Semantics.currencyCode: true
  currency_code as CurrencyCode,
  plane_type_id as PlaneTypeId,
  seats_max as SeatsMax,
  seats_occupied as SeatsOccupied,
  //여유좌석이랑 예약률 구해야함
  (seats_max - seats_occupied) as SeatsAvailable,
  division(seats_occupied * 100, seats_max, 2) as BookingRate
}
