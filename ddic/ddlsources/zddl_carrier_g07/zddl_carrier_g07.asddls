@AbapCatalog.sqlViewName: 'ZV_G07_CARRIER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Carrier'
@Metadata.ignorePropagatedAnnotations: true
define view zddl_carrier_g07
  as select from scarr
{
  key carrid   as Carrid,
      carrname as Carrname,
      currcode as Currcode,
      url      as Url
}
