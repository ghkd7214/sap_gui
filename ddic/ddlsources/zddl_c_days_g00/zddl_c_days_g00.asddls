@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Carrier ahead days'
@Metadata.ignorePropagatedAnnotations: true
define view entity zddl_c_days_g00 as select from zddl_r_flight_g00
{
  key Carrid,
      division( ahead_day, rowcnt, 1) as ahead_days
}
