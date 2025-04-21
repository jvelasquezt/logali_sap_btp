@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'booking supplements - root entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z360_R_BOOKSUPPL_4194
  as select from z360_bksuppl_a
  association        to parent Z360_R_BOOKING_4194 as _Booking        on $projection.BookingUUID = _Booking.BookingUUID
  association [1..1] to z360_r_travel_4194         as _Travel         on $projection.TravelUUID = _Travel.TravelUUID
  association [1..1] to /DMO/I_Supplement          as _Product        on $projection.SupplementID = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText      as _SupplementText on $projection.SupplementID = _SupplementText.SupplementID
{
  key booksuppl_uuid        as BookSupplUUID,
      root_uuid             as TravelUUID,
      parent_uuid           as BookingUUID,
      booking_supplement_id as BookingSupplementID,
      supplement_id         as SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currencycode          as CurrencyCode,
      //    Local Etag Field
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_change_at  as LocalLastChangeAt,
      _Booking,
      _Travel,
      _Product,
      _SupplementText 
}
