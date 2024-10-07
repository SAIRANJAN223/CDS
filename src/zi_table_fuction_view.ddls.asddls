@AbapCatalog.sqlViewName: 'ZV_TF_VIEW'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View for Table Function'
@Metadata.ignorePropagatedAnnotations: true
define view zi_table_fuction_view as select from zi_first_table_function(p_agency_id : '070017', p_status : 'A')
{
    travel_id as TravelId,
    booking_fee as BookingFee,
    total_price as TotalPrice,
    currency as CurrencyCode
}
