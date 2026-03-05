@AbapCatalog.sqlViewName: 'ZVHCOUNTRYG00'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help Country'
@Metadata.ignorePropagatedAnnotations: true
define view zvh_country_g00 as select from I_Country
{
    key Country,
    /* Associations */
    _Text[1:Language = $session.system_language].CountryName
}
