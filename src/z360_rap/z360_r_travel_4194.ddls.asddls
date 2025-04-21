@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'travel - root entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity z360_r_travel_4194
  as select from z360_travel_a
  composition [0..*] of Z360_R_BOOKING_4194 as _Booking
  
  association [0..1] to /DMO/I_Agency as _Agency on $projection.AgencyID = _Agency.AgencyID 
  association [0..1] to /DMO/I_Customer as _Customer on $projection.CustomerID = _Customer.CustomerID
  association [1..1] to /DMO/I_Overall_Status_VH as _OverallStatus on $projection.OverallStatus = _OverallStatus.OverallStatus
  association [0..1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency
{
  key travel_uuid           as TravelUUID,
      travel_id             as TravelID,
      agency_id             as AgencyID,
      customer_id           as CustomerID,
      begin_date            as BeginDate,
      end_date              as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee           as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price           as TotalPrice,
      currency_code         as CurrencyCode,
      description           as Description,
      overall_status        as OverallStatus,
      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
//      LOCAL ETAG FIELD -> ODATA ETAG
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
//      TOTAL ETAG FIELD
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      // Make association public
      _Booking,
      _Agency,
      _Customer,
      _OverallStatus,
      _Currency
}
