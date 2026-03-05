@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Model View'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
define root view entity zr_course_g07 as select from  ztcourse_g07
    association [1] to I_Country as _Country on $projection.Country = _Country.Country
    association [1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency
{
    key course_uuid as CourseUuid,
    course_id as CourseId,
    @Search.defaultSearchElement: true
    course_name as CourseName,
    course_length as CourseLength,
    country as Country,
    currency_code as CurrencyCode,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    price as Price,
    blocked as Blocked,
    
    description as Description,
    changed_by as ChangedBy,
    changed_at as ChangedAt,
    _Country,// Association to I_Country
    _Currency
    
}
