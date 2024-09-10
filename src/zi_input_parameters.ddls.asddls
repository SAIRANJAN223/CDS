@AbapCatalog.sqlViewName: 'ZV_INPUT_PARA'
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
//@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: 'CDS view with Input Parameters'
//@Metadata.ignorePropagatedAnnotations: true
define view ZI_INPUT_PARAMETERS
  with parameters
//    p_travel_id  : /dmo/travel_id, //These are madatory once declared
//    p_booking_id : /dmo/booking_id,
    p_currency_code : /dmo/currency_code,
    p_carrier_id : /dmo/carrier_id
  as select from zdb_sfbooking
{
  key travel_id     as TravelId,
  key booking_id    as BookingId,
      booking_date  as BookingDate,
      customer_id   as CustomerId,
      carrier_id    as CarrierId,
      connection_id as ConnectionId,
      flight_date   as FlightDate,
      flight_price  as FlightPrice,
      currency_code as CurrencyCode
}
where currency_code = :p_currency_code
