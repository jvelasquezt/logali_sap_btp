@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking supplement - interface entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z360_i_BOOKSUPPL_4194 as projection on Z360_R_BOOKSUPPL_4194
{
    key BookSupplUUID,
    TravelUUID,
    BookingUUID,
    BookingSupplementID,
    SupplementID,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Price,
    CurrencyCode,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    LocalLastChangeAt,
    /* Associations */
    _Booking : redirected to parent Z360_i_BOOKING_4194,
    _Product,
    _SupplementText,
    _Travel : redirected to Z360_i_TRAVEL_4194
}
