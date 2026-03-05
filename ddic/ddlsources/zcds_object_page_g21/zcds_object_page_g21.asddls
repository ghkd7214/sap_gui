@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exam Object Page'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_OBJECT_PAGE_G21
  as select from spfli
{
  key carrid            as Carrid,
  key connid            as Connid,
      countryfr         as Countryfr,
      cityfrom          as Cityfrom,
      airpfrom          as Airpfrom,
      countryto         as Countryto,
      cityto            as Cityto,
      airpto            as Airpto,
      fltime            as Fltime,
      deptime           as Deptime,
      arrtime           as Arrtime,
      @Semantics.quantity.unitOfMeasure: 'Distid'
      distance          as Distance,
      distid            as Distid,
      fltype            as Fltype,
      period            as Period,
      case
          when countryfr = countryto
          then 'Domestic'
          else 'International'
      end as domestic
}
