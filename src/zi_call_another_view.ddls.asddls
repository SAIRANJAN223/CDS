@AbapCatalog.sqlViewName: 'ZV_CALL_CDS_VIEW'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Calling another CDS view from a CDS view'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_CALL_ANOTHER_VIEW
    with parameters p_carrier_id : /dmo/carrier_id 
    as select from ZI_INPUT_PARAMETERS( p_currency_code : 'SGD', p_carrier_id : $parameters.p_carrier_id ) // The data_source_name can be a Entity or Database Table name 
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
}


