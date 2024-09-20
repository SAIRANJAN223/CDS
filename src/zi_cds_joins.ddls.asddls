@AbapCatalog.sqlViewName: 'ZV_CDS_JOINS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS view with JOINS'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_CDS_JOINS
  as select from     zdb_sftravel     as _travel
    inner join       zdb_sfbooking    as _booking    on _travel.travel_id = _booking.travel_id
    left outer join  zdb_sfcarrier    as _carrier    on _booking.carrier_id = _carrier.carrier_id
    right outer join zdb_sfcustomer   as _customer   on _booking.customer_id = _customer.customer_id
    right outer join zdb_sfbook_suppl as _book_suppl on _booking.travel_id  = _book_suppl.travel_id
                                                    and _booking.booking_id = _book_suppl.booking_id
//    right outer join zdb_sfbooking as _booking on _travel.travel_id = _booking.travel_id
//    join zdb_sfbooking as _booking on _travel.travel_id = _booking.travel_id
{
  key _travel.travel_id         as TravelIdTravel,
      _booking.travel_id        as TravelIdBooking,
      _booking.booking_id       as BookingId,
      _book_suppl.supplement_id as SupplementId,
      _booking.booking_date     as BookingDate,
      _customer.customer_id     as CustomerId,
      _carrier.carrier_id       as CarrierId,
      _booking.connection_id    as ConnectionId,
      _booking.flight_date      as FlightDate,
      _booking.flight_price     as FlightPrice,
      _booking.currency_code    as CurrencyCode,
      _travel.begin_date        as BeginDate,
      _travel.end_date          as EndDate,
      _travel.status            as Status
}
