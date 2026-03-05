@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZMENTORING_VIEW_07_3'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZMENTORING_VIEW_07_3 
  as select from sbook as sb 
    inner join scarr as sc on sb.carrid = sc.carrid
{
//  SELECT sc~carrname,
//         substring( sb~order_date, 1, 4 ) AS booking_year,
//         substring( sb~order_date, 5, 2 ) AS booking_month,
//         CASE
//           WHEN substring( sb~order_date, 5, 2 ) BETWEEN '03' AND '05' THEN 'Spring'
//           WHEN substring( sb~order_date, 5, 2 ) BETWEEN '06' AND '08' THEN 'Summer'
//           WHEN substring( sb~order_date, 5, 2 ) BETWEEN '09' AND '11' THEN 'Autumn'
//           ELSE 'Winter'
//         END AS season,
//         COUNT( sc~carrid ) AS total_bookings,
//         SUM( CASE sb~cancelled
//                WHEN 'X' THEN 1
//                ELSE 0
//              END ) AS cancelled_cnt
//    FROM sbook AS sb JOIN scarr AS sc ON sb~carrid = sc~carrid
//   WHERE sb~fldate IN @so_fld
//   GROUP BY sc~carrname,
//            substring( sb~order_date, 1, 4 ),
//            substring( sb~order_date, 5, 2 ),
//            CASE
//              WHEN substring( sb~order_date, 5, 2 ) BETWEEN '03' AND '05' THEN 'Spring'
//              WHEN substring( sb~order_date, 5, 2 ) BETWEEN '06' AND '08' THEN 'Summer'
//              WHEN substring( sb~order_date, 5, 2 ) BETWEEN '09' AND '11' THEN 'Autumn'
//              ELSE 'Winter'
//            END
//   HAVING COUNT( sc~carrid ) > 1000
//          AND SUM( CASE sb~cancelled WHEN 'X' THEN 1 ELSE 0 END ) < 80
//    ORDER BY sc~carrname,
//             booking_year,
//             booking_month
//     INTO TABLE @DATA(lt_monthly_stats).
    sc.carrname,
    substring( cast( sb.order_date as abap.char(8) ), 1, 4 ) as booking_year,
    substring( cast( sb.order_date as abap.char(8) ), 5, 2 ) as booking_month,
    case
        when substring( cast( sb.order_date as abap.char(8) ), 5, 2 ) between '03' and '05' then 'Spring'
        when substring( cast( sb.order_date as abap.char(8) ), 5, 2 ) between '06' and '08' then 'Summer'
        when substring( cast( sb.order_date as abap.char(8) ), 5, 2 ) between '09' and '11' then 'Autumn'
        else 'Winter'
    end as season,
    count( sb.carrid ) as total_bookings,
    sum( case sb.cancelled
             when 'X' then 1
             else 0
         end ) as cancelled_cnt
}
GROUP BY
    sc.carrname,
    substring( cast( sb.order_date as abap.char(8) ), 1, 4 ),
    substring( cast( sb.order_date as abap.char(8) ), 5, 2 ),
    case
        when substring( cast( sb.order_date as abap.char(8) ), 5, 2 ) between '03' and '05' then 'Spring'
        when substring( cast( sb.order_date as abap.char(8) ), 5, 2 ) between '06' and '08' then 'Summer'
        when substring( cast( sb.order_date as abap.char(8) ), 5, 2 ) between '09' and '11' then 'Autumn'
        else 'Winter'
    end
HAVING
    count( sb.carrid ) > 1000
    AND sum( case sb.cancelled when 'X' then 1 else 0 end ) < 80