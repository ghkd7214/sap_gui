@AbapCatalog.sqlViewName: 'ZEXVSPFLIG07'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '여객편 밸류핼프'
@Metadata.ignorePropagatedAnnotations: true
define view ZEX_VH_SPFLI_G07 as select from spfli
{
    key carrid as Carrid,
    key connid as Connid,
    cityfrom as Cityfrom,
    airpfrom as Airpfrom,
    cityto as Cityto,
    airpto as Airpto
}
