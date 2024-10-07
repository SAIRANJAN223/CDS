@EndUserText.label: 'First Table Function'
define table function zi_first_table_function
with parameters p_agency_id : /dmo/agency_id,
                p_status : /dmo/travel_status
returns {
  client    : abap.clnt;
  travel_id : /dmo/travel_id;
  agency_id     : /dmo/agency_id;
//  customer_id   : /dmo/customer_id;
  @Semantics.amount.currencyCode : 'currency'
  booking_fee   : /dmo/booking_fee;
  @Semantics.amount.currencyCode : 'currency'
  total_price   : /dmo/total_price;
  currency : /dmo/currency_code;
  //description   : /dmo/description;
  status        : /dmo/travel_status;
}
implemented by method zcl_table_function=>get_sflight_data;
