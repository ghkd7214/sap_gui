@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'c_days_g07'
@Metadata.ignorePropagatedAnnotations: true
define view entity zddl_c_days_g07
  as select from zddl_r_filght_g07
{
  key Carrid, Connid, Fldate,
      avg ( ahead_day as abap.dec( 16, 1)) as adays
}
group by
  Carrid, Connid, Fldate
