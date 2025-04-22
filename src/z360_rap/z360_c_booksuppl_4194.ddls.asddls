@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplements - Consumption entity'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true

define view entity Z360_c_BOOKSUPPL_4194 as projection on Z360_R_BOOKSUPPL_4194
{
    key BookSupplUUID,
    TravelUUID,
    BookingUUID,
    
    @Search.defaultSearchElement: true
    BookingSupplementID,
    @ObjectModel.text.element: [ 'SupplementDescription' ]
     @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Supplement_StdVH',
                                                     element: 'SupplementID' },
                                                      additionalBinding: [{ localElement: 'Price',
                                                                     element: 'Price',
                                                                     usage: #FILTER_AND_RESULT },
                                                                     
                                                                     { localElement: 'CurrencyCode',
                                                                     element: 'CurrencyCode',
                                                                     usage: #FILTER_AND_RESULT }],
                                                     useForValidation: true }]
    SupplementID,
    _SupplementText.Description as SupplementDescription : localized,
    
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Price,
    
    @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH',
                                                     element: 'Currency' },
                                                     useForValidation: true }]
    CurrencyCode,
    LocalLastChangeAt,
    /* Associations */
    _Booking : redirected to parent Z360_c_BOOKING_4194,
    _Product,
    _SupplementText,
    _Travel : redirected to Z360_c_TRAVEL_4194
}
