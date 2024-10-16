@EndUserText.label: 'Booking Supplement - Consumption'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true
@Search.searchable: true

define view entity ZW2_C_BKSUPPL_I
  as projection on ZW2_R_BKSUPPL_I
{
  key BookSupplUUID,
      TravelUUID,
      BookingUUID,

      @Search.defaultSearchElement: true
      BookingSupplementID,

      @ObjectModel.text.element: [ 'SupplementDescription' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Supplement_StdVH',
                                                     element: 'SupplementID'},
                                           additionalBinding: [{ localElement: 'CurrencyCode', 
                                                                 element: 'CurrencyCode',
                                                                 usage: #RESULT }],
                                           useForValidation: true }]
      SupplementID,
      _SupplementText.Description as SupplementDescription : localized,
      
      BookSupplPrice,
      
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH',
                                                     element: 'Currency'},
                                          useForValidation: true }]
      CurrencyCode,
      LocalLastChangedAt,
      
      /* Associations */
      _Booking : redirected to parent ZW2_C_BOOKING_I,
      _Product,
      _SupplementText,
      _Travel  : redirected to ZW2_C_TRAVEL_I
}
