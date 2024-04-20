@EndUserText.label: 'Booking Projetion'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity yC_BOOKING_TECH_M
  as projection on YI_BOOKING_TECH_M
{
  key TravelId,
  key BookingId,
      BookingDate,
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      _Customer.LastName         as CustomerName,
      @ObjectModel.text.element: [ 'CarrierName' ]
      CarrierId,
      _Carrier.Name              as CarrierName,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      @ObjectModel.text.element: [ 'BookingStatusText' ]
      BookingStatus,
      _Booking_Status._Text.Text as BookingStatusText : localized,
      LastChangedAt,
      /* Associations */
      _Bookingsuppl : redirected to composition child yC_BOOKSUPPL_TECH_M,
      _Booking_Status,
      _Carrier,
      _Connection,
      _Customer,
      _Travel       : redirected to parent yC_TRAVEL_TECH_M
}
