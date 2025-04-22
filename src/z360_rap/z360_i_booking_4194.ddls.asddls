@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking - interface entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z360_i_BOOKING_4194 as projection on Z360_R_BOOKING_4194
{
    key BookingUUID,
    TravelUUID,
    BookingID,
    BookingDate,
    CustomerID,
    AirlineID,
    ConnectionID,
    FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    LocalLastChangedAt,
    /* Associations */
    _BookingStatus,
    _BookingSupplement : redirected to composition child Z360_i_BOOKSUPPL_4194,
    _Carrier,
    _Connection,
    _Customer,
    _Travel: redirected to parent Z360_i_TRAVEL_4194
}
