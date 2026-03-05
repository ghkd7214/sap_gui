@AbapCatalog.sqlViewName: 'ZVHCONNECTIONG21'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exam Connection Value Help'
@Metadata.ignorePropagatedAnnotations: true
define view ZVH_CONNECTION_G21 as select from spfli
{
    key carrid as Carrid,
    key connid as Connid,
    cityfrom as Cityfrom,
    airpfrom as Airpfrom,
    countryto as Countryto,
    cityto as Cityto
}
