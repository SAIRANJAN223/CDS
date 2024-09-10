//Annotations are used to control the behaviour of the views
// Name of the view that will be created in GUI
@AbapCatalog.sqlViewName: 'ZV_FT_CDS_VIEW'
// On filter true the join table data are fetched after filteration, when it was false the data are fetched and then filtered
@AbapCatalog.compiler.compareFilter: true
//All DB table in sap have key fields, when preserveKey is true the field which is
//specified as key is made as key for the view otherwise DB table key will be the key for the view
@AbapCatalog.preserveKey: true
//Used to restrict the data based on the authority
@AccessControl.authorizationCheck: #NOT_REQUIRED
//Used to override the label from the DB tables
@EndUserText.label: 'First CDS view'
//
@Metadata.ignorePropagatedAnnotations: true
define view ZI_FIRST_CDS_VIEW
  as select from zdb_sfbooking
  //Joins and Associations are written here
{
  //Field which needs to shown in view and manipulations are done here
  key travel_id     as TravelId, // Fields can contain alias name which is mostly used in UI application level.
  key booking_id    as BookingId,
      booking_date  as BookingDate,
      customer_id   as CustomerId,
      carrier_id    as CarrierId,
      connection_id as ConnectionId,
      flight_date   as FlightDate,
      flight_price  as FlightPrice,
      currency_code as CurrencyCode
}
//where conditions are written here
