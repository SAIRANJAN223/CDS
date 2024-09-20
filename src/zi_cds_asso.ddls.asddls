@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS view with Association'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_CDS_ASSO
  as select from zdb_sftravel as _travel
  association [1..*] to zdb_sfbooking      as _booking  on _travel.travel_id = _booking.travel_id
  association [1]    to ZI_CDS_VIEW_ENTITY as _customer on _travel.customer_id = _customer.CustomerId
{
  key travel_id           as TravelId,
      agency_id           as AgencyId,
      //_customer.FirstName as FirstName, // Ad-Hoc 
      customer_id         as CustomerId,
      begin_date          as BeginDate,
      end_date            as EndDate,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      booking_fee         as BookingFee,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      total_price         as TotalPrice,
      currency_code       as CurrencyCode,
      description         as Description,
      status              as Status,
      createdby           as Createdby,
      createdat           as Createdat,
      lastchangedby       as Lastchangedby,
      lastchangedat       as Lastchangedat,

      //Make association Public
      _booking,
      _customer
}
