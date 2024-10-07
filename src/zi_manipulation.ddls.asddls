@AbapCatalog.sqlViewName: 'ZV_SIM_MAN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS view with Simple maipulations'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_MANIPULATION 
    as select from zdb_sfbooking
{
    key travel_id as TravelId,
    key booking_id as BookingId,
    booking_date as BookingDate,
    currency_code as CurrencyCode,
    
    case currency_code 
    when 'USD'
        then 'Dollers'
    when 'EUR'
        then 'Euro'
    else
        'Unknown'
    end as Currency,
    
    flight_date as FlightDate,
    
    case 
        when flight_date < $session.system_date
            then 'Completed Journey'
        when flight_date > $session.system_date
            then 'Future Journey'
        else
            'Unkown'
    end as Journey,
    
    flight_price as Flight_Price,
    
    case 
        when flight_price > 1000
            then flight_price - (division(flight_price,100,2) * 10)
        when flight_price > 5000
            then flight_price - (division(flight_price,100,2) * 20)
        else
            flight_price
    end as DiscountedPrice,
    
    case 
        when flight_price < 1000
            then 'First Class'
        when flight_price > 1000
            then 'Business Class'
        else
            'Unkown Class'
    end as Class

}
