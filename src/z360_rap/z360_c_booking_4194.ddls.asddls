@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking - Consumption entity'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true

define view entity Z360_c_BOOKING_4194
  as projection on Z360_R_BOOKING_4194
{
  key BookingUUID,
      TravelUUID,
      @Search.defaultSearchElement: true
      BookingID,
      BookingDate,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'CustomerName' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer_StdVH',
                                                     element: 'CustomerID' },
                                                     useForValidation: true }]
      CustomerID,
      _Customer.LastName as CustomerName,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'CarrierName' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Flight_StdVH',
                                               element: 'AirlineID' },
                                               additionalBinding: [{ localElement: 'ConnectionID',
                                                                     element: 'ConnectionID',
                                                                     usage: #RESULT },

                                                                     { localElement: 'FlightDate',
                                                                     element: 'FlightDate',
                                                                     usage: #RESULT },

                                                                     { localElement: 'FlightPrice',
                                                                     element: 'Price',
                                                                     usage: #RESULT },

                                                                     { localElement: 'CurrencyCode',
                                                                     element: 'CurrencyCode',
                                                                     usage: #RESULT }],
                                                                     useForValidation: true }]
      AirlineID,
      _Carrier.Name      as CarrierName,
      
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Flight_StdVH',
                                               element: 'ConnectionID' },
                                               additionalBinding: [{ localElement: 'AirlineID',
                                                                     element: 'AirlineID',
                                                                     usage: #FILTER_AND_RESULT },

                                                                     { localElement: 'FlightDate',
                                                                     element: 'FlightDate',
                                                                     usage: #RESULT },

                                                                     { localElement: 'FlightPrice',
                                                                     element: 'Price',
                                                                     usage: #RESULT },

                                                                     { localElement: 'CurrencyCode',
                                                                     element: 'CurrencyCode',
                                                                     usage: #RESULT }],
                                                                     useForValidation: true }]
      ConnectionID,
      
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Flight_StdVH',
                                               element: 'FlightDate' },
                                               additionalBinding: [{ localElement: 'AirlineID',
                                                                     element: 'AirlineID',
                                                                     usage: #FILTER_AND_RESULT },

                                                                     { localElement: 'ConnectionID',
                                                                     element: 'ConnectionID',
                                                                     usage: #FILTER_AND_RESULT },

                                                                     { localElement: 'FlightPrice',
                                                                     element: 'Price',
                                                                     usage: #RESULT },

                                                                     { localElement: 'CurrencyCode',
                                                                     element: 'CurrencyCode',
                                                                     usage: #RESULT }],
                                                                     useForValidation: true }]
      FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH',
                                                     element: 'Currency' },
                                                     useForValidation: true }]
      CurrencyCode,
      
      @ObjectModel.text.element: [ 'BookingStatusText' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Booking_Status_VH',
                                                     element: 'BookingStatus' },
                                                     useForValidation: true }]
      BookingStatus,
      _BookingStatus._Text.Text as BookingStatusText : localized,
      LocalLastChangedAt,
      /* Associations */
      _BookingStatus,
      _BookingSupplement : redirected to composition child Z360_c_BOOKSUPPL_4194,
      _Carrier,
      _Connection,
      _Customer,
      _Travel : redirected to parent Z360_c_TRAVEL_4194
}
