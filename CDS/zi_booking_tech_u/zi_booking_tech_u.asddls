@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking view'


define view entity ZI_BOOKING_TECH_U
  as select from /dmo/booking as Booking

  association        to parent ZI_TRAVAL_TECH_U     as _Travel     on  $projection.TravelID = _Travel.TravelID

  association [1..1] to /DMO/I_Customer            as _Customer   on  $projection.CustomerID = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier             as _Carrier    on  $projection.AirlineID = _Carrier.AirlineID
  association [1..1] to /DMO/I_Connection          as _Connection on  $projection.AirlineID    = _Connection.AirlineID
                                                                  and $projection.ConnectionID = _Connection.ConnectionID
{

  key Booking.travel_id     as TravelID,

  key Booking.booking_id    as BookingID,

      Booking.booking_date  as BookingDate,

      Booking.customer_id   as CustomerID,

      Booking.carrier_id    as AirlineID,

      Booking.connection_id as ConnectionID,

      Booking.flight_date   as FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      Booking.flight_price  as FlightPrice,

      Booking.currency_code as CurrencyCode,

      /* Associations */
      _Travel,
      _Customer,
      _Carrier,
      _Connection

}
