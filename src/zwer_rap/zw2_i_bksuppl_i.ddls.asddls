@EndUserText.label: 'Booking Supplement - Interface'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZW2_I_BKSUPPL_I
  as projection on ZW2_R_BKSUPPL_I
{
  key BookSupplUUID,
      TravelUUID,
      BookingUUID,
      BookingSupplementID,
      SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookSupplPrice,
      CurrencyCode,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      
      /* Associations */
      _Booking : redirected to parent ZW2_I_BOOKING_I,
      _Product,
      _SupplementText,
      _Travel  : redirected to ZW2_I_TRAVEL_I
}
