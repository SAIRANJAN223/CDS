@AbapCatalog.sqlViewName: 'ZV_SESSION_VAR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS view with Session Variables'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_SESSION_VARIABLES as select from ZI_FIRST_CDS_VIEW
{
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    FlightPrice,
    CurrencyCode
}where BookingDate > $session.system_date
