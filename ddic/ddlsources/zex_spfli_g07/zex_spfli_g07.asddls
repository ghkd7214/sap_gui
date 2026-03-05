@AbapCatalog.sqlViewName: 'ZEXSPFLIG07'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '시험'
@Metadata.ignorePropagatedAnnotations: true
@OData.publish: true
@Metadata.allowExtensions: true
@Search.searchable: true
@UI.headerInfo.typeNamePlural: 'Flight Connections'
@UI.headerInfo.typeName: 'Flight Schedule'
@UI.headerInfo.title.value: 'Connid'
@UI.headerInfo.description.value:'Carrname'
define view ZEX_SPFLI_G07 as select from spfli
  association [1..1] to I_Country as _Countryfr on $projection.Countryfr = _Countryfr.Country
  association [1..1] to I_Country as _Countryto on $projection.Countryto = _Countryto.Country
  association [1..1] to sairport  as _Airpfr    on $projection.Airpfrom  = _Airpfr.id
  association [1..1] to sairport  as _Airpto    on $projection.Airpto    = _Airpto.id
  association [1..1] to ZEX_VH_AIRLINE_g07 as _Airline on $projection.Carrid = _Airline.Carrid
  association [1..1] to ZEX_VH_SPFLI_G07   as _Spfli on $projection.Carrid = _Spfli.Carrid and $projection.Connid = _Spfli.Connid
  association [1..1] to ZEX_OBJ_PAGE_G07   as _ObjPage on $projection.Carrid = _ObjPage.Carrid and $projection.Connid = _ObjPage.Connid
  association [*] to ZEX_OBJ_SFLIGHT_G07   as _ObjSflight on $projection.Carrid = _ObjSflight.Carrid and $projection.Connid = _ObjSflight.Connid
  association [*] to ZEX_OBJ_CHART1_G07    as _Chart1 on $projection.Carrid = _Chart1.Carrid and $projection.Connid = _Chart1.Connid
  association [*] to ZEX_OBJ_CHART2_G07    as _Chart2 on $projection.Carrid = _Chart2.Carrid and $projection.Connid = _Chart2.Connid
{
    @UI.selectionField.position: 10
    @Consumption.valueHelp: '_Airline'
    key carrid    as Carrid,

    @UI.selectionField.position: 20
    @Consumption.valueHelp: '_Spfli'
    key connid    as Connid,

    @ObjectModel.text.element: [ 'CountryfrName' ]
    @UI.textArrangement: #TEXT_LAST
    countryfr as Countryfr,
    _Countryfr._Text[1:Language = $session.system_language].CountryName as CountryfrName,
    
    cityfrom  as Cityfrom,

    @ObjectModel.text.element: [ 'Airpfrom' ]
    @UI.textArrangement: #TEXT_LAST
    _Airpfr.name as AirpfrName,
    
    airpfrom  as Airpfrom,
    
    @ObjectModel.text.element: [ 'CountrytoName' ]
    @UI.textArrangement: #TEXT_LAST
    countryto as Countryto,
    _Countryto._Text[1:Language = $session.system_language].CountryName as CountrytoName,

    cityto    as Cityto,
    
    @ObjectModel.text.element: [ 'Airpto' ]
    @UI.textArrangement: #TEXT_LAST
    _Airpto.name as AirptoName,
    
    airpto    as Airpto,

    _ObjPage.Deptime as Deptime,
    _ObjPage.Arrtime as Arrtime,
    
//    @UI.fieldGroup: [{ qualifier: 'DIS', position: 10}]
    @Semantics.quantity.unitOfMeasure: 'Distid'
    _ObjPage.Distance as Distance,
    _ObjPage.Distid as Distid,
//    @UI.fieldGroup: [{ qualifier: 'DIS', position: 20}]
    _ObjPage.Fltype as Fltype,
//    @UI.fieldGroup: [{ qualifier: 'DIS', position: 30}]
    _ObjPage.Period as Period,
//    @UI.fieldGroup: [{ qualifier: 'DIS', position: 40, label: 'Domestic/International'}]
    _ObjPage.IsPeriod as IsPeriod,
    
    _Airline.Carrname as Carrname,
    
    // association
    _Countryfr,
    _Countryto,
    _Airpfr,
    _Airpto,
    _Airline,
    _Spfli,
    _ObjPage,
    _ObjSflight,
    _Chart1,
    _Chart2
    

}
