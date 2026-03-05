@AbapCatalog.sqlViewName: 'ZCDSSCARRG07'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Airline'
@Metadata.ignorePropagatedAnnotations: true
@OData.publish: true
define view zcds_scarr_g07 as select from scarr
{
  
  @UI.lineItem: [{ position: 10 }]
  key carrid as Carrid,
  @UI.lineItem: [{ position: 20 }]
  carrname as Carrname,
  @UI.lineItem: [{ position: 30 }]
  currcode as Currcode,
  @UI.lineItem: [{ position: 40 }]
  url as Url
}
