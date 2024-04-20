@EndUserText.label: 'Travel Projection view'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity yC_TRAVEL_TECH_M
  provider contract transactional_query
  as projection on YI_TRAVEL_TECH_M
{
  key TravelId,
      @ObjectModel.text.element: [ 'AgencyName' ]
      AgencyId,
      _Agency.Name       as AgencyName,
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      Description,
      @ObjectModel.text.element: [ 'OverallStatusText' ]
      OverallStatus,
      _Status._Text.Text as OverallStatusText : localized,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child yC_BOOKING_TECH_M,
      _Currency,
      _Customer,
      _Status
}
