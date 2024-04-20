@EndUserText.label: 'Approver Projection Booking'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI: {
  headerInfo: { typeName: 'Booking',
                typeNamePlural: 'Bookings',
                title: { type: #STANDARD, value: 'BookingID' }
  }
}

@Search.searchable: true
define view entity YC_BOOKING_APPROVER_M as projection on YI_BOOKING_TECH_M
{
     @UI.facet: [ { id:            'Booking',
                           purpose:       #STANDARD,
                           type:          #IDENTIFICATION_REFERENCE,
                           label:         'Booking',
                           position:      10 }]
      @Search.defaultSearchElement: true
    key TravelId,
    @UI: { lineItem:       [ { position: 20, importance: #HIGH } ],
          identification: [ { position: 20 } ] }
      @Search.defaultSearchElement: true
    key BookingId,
    @UI: { lineItem:       [ { position: 30, importance: #HIGH } ],
             identification: [ { position: 30 } ] }
    BookingDate,
     @UI: { lineItem:       [ { position: 40, importance: #HIGH } ],
             identification: [ { position: 40 } ],
             selectionField: [{ position: 10 }]
              }
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
    CustomerId,
     _Customer.LastName as CustomerName,
          @UI: { lineItem:       [ { position: 50, importance: #HIGH } ],
             identification: [ { position: 50 } ] }
      @ObjectModel.text.element: ['CarrierName']
    CarrierId,
 _Carrier.Name      as CarrierName,
  @UI: { lineItem:       [ { position: 60, importance: #HIGH } ],
             identification: [ { position: 60 } ] }
    ConnectionId,
       @UI: { lineItem:       [ { position: 70, importance: #HIGH } ],
             identification: [ { position: 70 } ] }
    FlightDate,
     @UI: { lineItem:       [ { position: 80, importance: #HIGH } ],
             identification: [ { position: 80 } ] }
      @Semantics.amount.currencyCode: 'CurrencyCode'
    FlightPrice,
    CurrencyCode,
    @UI: { lineItem:       [ { position: 90, importance: #HIGH, label: 'Status' } ],
             identification: [ { position: 90, label: 'Status' } ],
             textArrangement: #TEXT_ONLY }
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Booking_Status_VH', element: 'BookingStatus' }}]
      @ObjectModel.text.element: ['BookingStatusText']
    BookingStatus,
     @UI.hidden: true
      _Booking_Status._Text.Text as BookingStatusText : localized,
      @UI.hidden: true
    LastChangedAt,
    /* Associations */
    _Bookingsuppl,
    _Booking_Status,
    _Carrier,
    _Connection,
    _Customer,
    _Travel : redirected to parent YC_TRAVEL_APPROVER_M
}
