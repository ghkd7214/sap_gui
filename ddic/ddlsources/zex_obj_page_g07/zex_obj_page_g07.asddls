@AbapCatalog.sqlViewName: 'ZEXOBJPAGEG07'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '오브젝트 페이지 전용'
@Metadata.ignorePropagatedAnnotations: true
define view ZEX_OBJ_PAGE_G07 as select from spfli
{
    key carrid as Carrid,
    key connid as Connid,
    countryfr as Countryfr,
    cityfrom as Cityfrom,
    airpfrom as Airpfrom,
    countryto as Countryto,
    cityto as Cityto,
    airpto as Airpto,
    fltime as Fltime,
    deptime as Deptime,
    arrtime as Arrtime,
    @Semantics.quantity.unitOfMeasure: 'Distid'
    distance as Distance,
    distid as Distid,
    fltype as Fltype,
    period as Period,
    
    case when countryfr = countryto then 'Demestic'
         when countryfr <> countryto then 'International'
         else 'Unknown'
    end as IsPeriod
}
