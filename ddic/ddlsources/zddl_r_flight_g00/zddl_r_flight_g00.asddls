@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight data'
@Metadata.ignorePropagatedAnnotations: true
define view entity zddl_r_flight_g00 as select from sbook
{
  key carrid as Carrid,
  key connid as Connid,
  key fldate as Fldate,
      dats_days_between(order_date, fldate) as ahead_day,
      cast( 1 as abap.int4 ) as rowcnt
} where cancelled <> 'X'
