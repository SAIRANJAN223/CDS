CLASS zcl_table_function DEFINITION PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.
    CLASS-METHODS get_sflight_data FOR TABLE FUNCTION zi_first_table_function.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_table_function IMPLEMENTATION.
  METHOD get_sflight_data BY DATABASE FUNCTION FOR HDB LANGUAGE SQLSCRIPT
                                      OPTIONS READ-ONLY USING zdb_sftravel.

    RETURN select client,
                  travel_id,
                  agency_id,
                  booking_fee,
                  total_price,
                  currency_code as Currency,
                  status
                  from zdb_sftravel
                  where status = :p_status
                    and agency_id = :p_agency_id;

  ENDMETHOD.
ENDCLASS.
