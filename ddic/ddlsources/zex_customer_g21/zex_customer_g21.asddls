@AbapCatalog.sqlViewName: 'ZEXCUSTOMERG21'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exam Customer'
@Metadata.ignorePropagatedAnnotations: true
@OData.publish: true
@Search.searchable: true

@UI.headerInfo.typeName: 'Flight Schedule'
@UI.headerInfo.title.value: 'Connid'
@UI.headerInfo.description.value: 'Carrname'
define view ZEX_CUSTOMER_G21 as select from spfli
    association[1] to zcds_scarr_g21 as _Carrier
        on $projection.Carrid = _Carrier.Carrid
    association[1] to sairport as _Airportfr
        on $projection.Airpfrom = _Airportfr.id
    association[1] to sairport as _Airportto
        on $projection.Airpto = _Airportto.id
    association[1] to I_Country as _Countryfr
        on $projection.Countryfr = _Countryfr.Country
    association[1] to I_Country as _Countryto
        on $projection.Countryto = _Countryto.Country
    association[1] to ZVH_CONNECTION_G21 as _Connection
        on $projection.Carrid = _Connection.Carrid
            and $projection.Connid = _Connection.Connid
    association[1] to ZCDS_OBJECT_PAGE_G21 as _General
        on $projection.Carrid = _General.Carrid
            and $projection.Connid = _General.Connid
    association[*] to ZCDS_SFLIGHT_G21 as _Flight
        on $projection.Carrid = _Flight.Carrid
            and $projection.Connid = _Flight.Connid
    association[*] to ZEX_AMOUNT_G21 as _Amount
        on $projection.Carrid = _Amount.Carrid
            and $projection.Connid = _Amount.Connid
    association[0..*] to ZEX_CLASS_G21 as _Class
        on $projection.Carrid = _Class.Carrid
            and $projection.Connid = _Class.Connid
{
    @UI.facet: [{ id: 'COLFACT1',type: #COLLECTION, position: 10, label: 'General Info'},
                  { parentId: 'COLFACT1', type: #FIELDGROUP_REFERENCE, label: 'Departure Info',
                  targetQualifier: 'DEP', position: 10},
                  { parentId: 'COLFACT1', type: #FIELDGROUP_REFERENCE, label: 'Arrival Info',
                  targetQualifier: 'ARR', position: 20},
                  { parentId: 'COLFACT1', type: #FIELDGROUP_REFERENCE, label: 'Distance Info',
                  targetQualifier: 'DIS', position: 30},
                { type: #LINEITEM_REFERENCE, targetElement: '_Flight', position: 20, label: 'Flight List'},
                { type: #CHART_REFERENCE, targetElement: '_Amount', label: 'Amount By Year & Amount', position: 30 },
                { type: #CHART_REFERENCE, targetElement: '_Class', label: 'Numbers & Amount by Class', position: 40}]

    @UI.lineItem: [{ position : 10 }]
    @ObjectModel.text.element: [ 'Carrname' ]
    @UI.textArrangement: #TEXT_FIRST
    @UI.selectionField: [{ position : 10 }]
    @Consumption.valueHelp: '_Carrier'
    key carrid as Carrid,
    @UI.lineItem: [{ position : 20 }]
    @UI.selectionField: [{ position : 20 }]
    @Consumption.valueHelp: '_Connection'
    key connid as Connid,
    @UI.lineItem: [{ position : 30 }]
    @ObjectModel.text.element: [ 'CountryNamefr' ]
    @UI.textArrangement: #TEXT_LAST
    @UI.fieldGroup: [{ qualifier: 'DEP', position: 10}]
    countryfr as Countryfr,
    @UI.lineItem: [{ position : 40 }]
    @Search.defaultSearchElement: true
    @UI.fieldGroup: [{ qualifier: 'DEP', position: 20}]
    cityfrom as Cityfrom,
    @UI.lineItem: [{ position : 50 }]
    @UI.fieldGroup: [{ qualifier: 'DEP', position: 30}]
    @ObjectModel.text.element: [ 'Namefr' ]
    airpfrom as Airpfrom,
    @UI.fieldGroup: [{ qualifier: 'DEP', position: 40}]
    _General.Deptime as Deptime,
    @UI.lineItem: [{ position : 60 }]
    @ObjectModel.text.element: [ 'CountryNameto' ]
    @UI.textArrangement: #TEXT_LAST
    @UI.fieldGroup: [{ qualifier: 'ARR', position: 10}]
    countryto as Countryto,
    @UI.lineItem: [{ position : 70 }]
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    @UI.fieldGroup: [{ qualifier: 'ARR', position: 20}]
    cityto as Cityto,
    @UI.lineItem: [{ position : 80 }]
    @ObjectModel.text.element: [ 'Nameto' ]
    @UI.textArrangement: #TEXT_FIRST
    @UI.fieldGroup: [{ qualifier: 'ARR', position: 30}]
    airpto as Airpto,
    @UI.fieldGroup: [{ qualifier: 'ARR', position: 40}]
    _General.Arrtime as Arrtime,
    @UI.fieldGroup: [{ qualifier: 'DIS', position: 10}]
    @Semantics.quantity.unitOfMeasure: 'Distid'
    _General.Distance as Distance,
    @UI.fieldGroup: [{ qualifier: 'DIS', position: 20}]
    _General.Fltype as Fltype,
    @UI.fieldGroup: [{ qualifier: 'DIS', position: 30}]
    _General.Period as Period,
    @UI.fieldGroup: [{ qualifier: 'DIS', position: 40, label: 'Domestic/International'}]
    _General.domestic as Domestic,
    
    _Carrier,
    _Carrier.Carrname as Carrname,
    _Airportfr,
    _Airportfr.name as Namefr,
    _Airportto,
    _Airportto.name as Nameto,
    _Countryfr,
    _Countryfr._Text[1:Language = $session.system_language].CountryName as CountryNamefr,
    _Countryto,
    _Countryto._Text[1:Language = $session.system_language].CountryName as CountryNameto,
    _Connection,
    _General,
    _General.Distid,
    _Flight,
    _Amount,
    _Class
}
