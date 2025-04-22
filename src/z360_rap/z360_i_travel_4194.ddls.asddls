@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel - Interface entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z360_i_TRAVEL_4194
provider contract transactional_interface
  as projection on z360_r_travel_4194
{
  key TravelUUID,
      TravelID,
      AgencyID,
      CustomerID,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      OverallStatus,
      //      LOCAL ETAG FIELD -> ODATA ETAG
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      
      //      TOTAL ETAG FIELD
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking: redirected to composition child Z360_i_BOOKING_4194,
      _Currency,
      _Customer,
      _OverallStatus
}
