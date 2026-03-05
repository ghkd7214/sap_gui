@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity zc_course_g07 as projection on zr_course_g07
{
    key CourseUuid,
    @UI.selectionField: [{ position: 10 }]
    CourseId,
    @Search.defaultSearchElement: true
    CourseName,
    CourseLength,
    @UI.selectionField: [{ position: 20 }]
    @ObjectModel.text.element: [ 'CountryName' ]
    @UI.textArrangement: #TEXT_LAST
    Country,
    @ObjectModel.text.element: ['CurrencyName']
    CurrencyCode,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Price,
    Blocked,
    @Search.defaultSearchElement: true
    Description,
    ChangedBy,
    ChangedAt,
    _Currency._Text[1: Language = $session.system_language].CurrencyName,
    _Country._Text[1: Language = $session.system_language].CountryName,
    /* Associations */
    _Country,
    _Currency
}
