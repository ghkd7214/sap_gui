@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'mentoring view 1'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZMENTORING_VIEW_07_1 as select from sflight
{
  key carrid,
  key connid,
  key fldate,
      seatsmax,
      seatsocc,
      currency,

      case
        when seatsocc = 0 
          then '예약 없음'
        
        when seatsocc < ( cast( seatsmax as abap.fltp ) * 0.50 ) 
          then '여유'
        when seatsocc < ( cast( seatsmax as abap.fltp ) * 0.90 ) 
          then '보통'
        else '매진 임박'
      end as occupancy_status,

      /* 통화 관련 로직도 뷰 내부에 포함 */
      case currency
        when 'USD' then '미국 달러 결제'
        when 'EUR' then '유로 결제'
        else '기타 통화'
      end as currency_note
}
