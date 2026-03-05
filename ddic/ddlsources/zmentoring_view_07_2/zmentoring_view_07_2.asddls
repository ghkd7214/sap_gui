@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZMENTORING_VIEW_07_2'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZMENTORING_VIEW_07_2
  as select from scustom as sc
    inner join   sbook   as sb on sc.id = sb.customid
{
  key sc.id                            as CustomerId,
      sc.name                          as CustomerName,
      sc.city                          as City,

      count(*)                         as BookingCount,

      cast (sum( case sb.class
             when 'F' then 50
             when 'C' then 30
             else 10
           end ) as abap.int4 )        as LoyaltyPoints,

      cast ( avg( sb.luggweight as abap.fltp )
                  as abap.dec(10, 2) ) as AvgLuggage


}
group by
  sc.id,
  sc.name,
  sc.city

having
  count(*) >= 3
