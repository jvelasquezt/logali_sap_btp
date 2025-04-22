@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel - Consumption entity'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity Z360_c_TRAVEL_4194
  provider contract transactional_query
  as projection on z360_r_travel_4194

{
  key TravelUUID,
      @Search.defaultSearchElement: true
      TravelID,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'AgencyName' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Agency_StdVH',
                                                     element: 'AgencyID' },
                                                     useForValidation: true }]
      AgencyID,
      _Agency.Name       as AgencyName,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'CustomerName' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer_StdVH',
                                                     element: 'CustomerID' },
                                                     useForValidation: true }]
      CustomerID,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH',
                                                     element: 'Currency' },
                                                     useForValidation: true }]
      CurrencyCode,
      Description,
      
      @ObjectModel.text.element: [ 'OverallStatusText' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Overall_Status_VH',
                                                     element: 'OverallStatus' },
                                                     useForValidation: true }]
      OverallStatus,
      _OverallStatus._Text.Text as OverallStatusText : localized,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child Z360_c_BOOKING_4194,
      _Currency,
      _Customer,
      _OverallStatus
}
