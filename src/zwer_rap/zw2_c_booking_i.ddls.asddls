@EndUserText.label: 'Booking - Consumption'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true
@Search.searchable: true

define view entity ZW2_C_BOOKING_I
  as projection on ZW2_R_BOOKING_I
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

      @ObjectModel.text.element: [ 'CarrierName' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Flight_StdVH',
                                                     element: 'AirlineID' },
                                           additionalBinding: [{ localElement: 'CurrencyCode',
                                                                 element: 'CurrencyCode',
                                                                 usage: #RESULT },
                                                               { localElement: 'ConnectionID',
                                                                 element: 'ConnectionID',
                                                                 usage: #RESULT }],
                                           useForValidation: true }]
      AirlineID,
      _Carrier.Name      as CarrierName,

      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Flight_StdVH',
                                                     element: 'ConnectionID' },
                                           additionalBinding: [ { localElement: 'AirlineID',
                                                                  element: 'AirlineID',
                                                                  usage: #RESULT },
                                                                { localElement: 'FlightDate',
                                                                  element: 'FlightDate',
                                                                  usage: #RESULT },
                                                                { localElement: 'CurrencyCode',
                                                                  element: 'CurrencyCode',
                                                                  usage: #RESULT } ],                          
                                           useForValidation: true }]
      ConnectionID,
      
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Flight_StdVH',
                                                     element: 'FlightDate' },
                                           additionalBinding: [ { localElement: 'AirlineID',
                                                                  element: 'AirlineID',
                                                                  usage: #RESULT },
                                                                { localElement: 'ConnectionID',
                                                                  element: 'ConnectionID',
                                                                  usage: #RESULT },
                                                                { localElement: 'CurrencyCode',
                                                                  element: 'CurrencyCode',
                                                                  usage: #RESULT } ],                          
                                           useForValidation: true }]
      FlightDate,
      FlightPrice,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH',
                                                     element: 'Currency'},
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
      _BookingSupplement : redirected to composition child ZW2_C_BKSUPPL_I,
      _Carrier,
      _Connection,
      _Customer,
      _Travel            : redirected to parent ZW2_C_TRAVEL_I
}
