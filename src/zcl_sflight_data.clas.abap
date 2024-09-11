CLASS zcl_sflight_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    METHODS getBooking.
    CLASS-METHODS getTravel.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_sflight_data IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    me->getBooking( ).
    COMMIT WORK.
    out->write( 'Booking data inserted'  ).
    me->getTravel( ).
    COMMIT WORK.
    out->write( 'Travel data inserted'  ).

  ENDMETHOD.

  METHOD getBooking.

    DELETE FROM zdb_sfbooking.

    INSERT zdb_sfbooking FROM
        ( SELECT FROM /dmo/booking
            FIELDS
                travel_id         AS travel_id,
                booking_id        AS booking_id,
                booking_date      AS booking_date,
                customer_id       AS customer_id,
                carrier_id        AS carrier_id,
                connection_id     AS connection_id,
                flight_date       AS flight_date,
                flight_price      AS flight_price,
                currency_code     AS currency_code
            ORDER BY booking_id
*                  UP TO 10 ROWS
      ).

  ENDMETHOD.

  METHOD getTravel.

    DELETE FROM zdb_sftravel.

    INSERT zdb_sftravel FROM
            ( SELECT FROM /dmo/travel
                FIELDS
                    travel_id     AS TravelId,
                    agency_id     AS AgencyId,
                    customer_id   AS CustomerId,
                    begin_date    AS BeginDate,
                    end_date      AS EndDate,
                    booking_fee   AS BookingFee,
                    total_price   AS TotalPrice,
                    currency_code AS CurrencyCode,
                    description   AS Description,
                    status        AS Status,
                    createdby     AS CreatedBy,
                    createdat     AS CreatedAt,
                    lastchangedby AS LastChangedBy,
                    lastchangedat AS LastChangedAt
                ORDER BY travel_id
             ).


  ENDMETHOD.

ENDCLASS.
