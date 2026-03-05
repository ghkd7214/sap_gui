@AbapCatalog.sqlViewName: 'ZEXVHAIRLINEG07'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '공항 밸류핼프'
@Metadata.ignorePropagatedAnnotations: true
define view ZEX_VH_AIRLINE_g07 as select from scarr
{
     key carrid as Carrid,
    carrname as Carrname
}
