@AbapCatalog.sqlViewName: 'ZV_TF_VIEW_JOIN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View for Table Function with joins'
@Metadata.ignorePropagatedAnnotations: true
define view zi_tf_view_join as select from zi_first_table_function(p_agency_id : '070017', p_status : 'A') as _travel
inner join zdb_sfbooking as _booking on _travel.travel_id = _booking.travel_id
{
    key _travel.travel_id as TravelId,
    key _booking.booking_id as BookingId,
    _travel.booking_fee as BookingFee,
    _travel.total_price as TotalPrice,
    _travel.currency as CurrencyCode,
    _travel.status as Status
}
