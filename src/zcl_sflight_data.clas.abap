CLASS zcl_sflight_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    METHODS getBookingDetails.
    CLASS-METHODS getTravelDetails.
    METHODS getCarrierDetails.
    CLASS-METHODS getCustomerDetails.
    CLASS-METHODS getBookSupplDetails.
    METHODS getFlightDetails.
    CLASS-METHODS getAgencyDetails.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_sflight_data IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    me->getBookingDetails( ).
    COMMIT WORK.
    out->write( 'Booking data inserted'  ).
    me->getTravelDetails( ).
    COMMIT WORK.
    out->write( 'Travel data inserted'  ).
    me->getcarrierDetails( ).
    COMMIT WORK.
    out->write( 'Carrier data inserted' ).
    getcustomerDetails( ).
    COMMIT WORK.
    out->write( 'Customer data inserted' ).
    getbooksupplDetails( ).
    COMMIT WORK.
    out->write( 'Booking Supplement data inserted' ).
    getFlightDetails( ).
    COMMIT WORK.
    out->write( 'Flight data inserted' ).
    getAgencyDetails( ).
    COMMIT WORK.
    out->write( 'Agency data inserted' ).

  ENDMETHOD.

  METHOD getBookingDetails.

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

*    UPDATE zdb_sfbooking
*      SET booking_id = ''
*      WHERE booking_id IS NOT INITIAL .

*    delete from zdb_sfbooking
*        where travel_id = 00000001.

  ENDMETHOD.

  METHOD getTravelDetails.

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

  METHOD getCarrierDetails.

    DELETE FROM zdb_sfcarrier.

    INSERT zdb_sfcarrier FROM
            ( SELECT FROM /dmo/carrier
                FIELDS
                  carrier_id AS CarrierId,
                  name AS CarrierName,
                  currency_code AS CurrencyCode,
                  local_created_by AS LocalCreatedBy,
                  local_created_at AS LocalCreatedAt,
                  local_last_changed_by AS LocalLastChanged,
                  local_last_changed_at AS LocalLastChangedAt,
                  last_changed_at AS LastChangedAt
             ).

    UPDATE zdb_sfcarrier
       SET name = ''
       WHERE name IS NOT INITIAL.

  ENDMETHOD.

  METHOD getCustomerDetails.

    DELETE FROM zdb_sfcustomer.

    INSERT zdb_sfcustomer
        FROM ( SELECT FROM /dmo/customer
                FIELDS
                  customer_id AS CustomerId,
                  first_name AS FirstName,
                  last_name AS LadtName,
                  title AS Title,
                  street AS Street,
                  postal_code AS PostalCode,
                  city AS City,
                  country_code AS CountryCode,
                  phone_number AS PhoneNumber,
                  email_address AS EmailAddress,
                  local_created_by AS LocalCreatedBy,
                  local_created_at AS LocalCreatedAt,
                  local_last_changed_by AS LocalLastChangedBy,
                  local_last_changed_at AS LocalLastChangedAt,
                  last_changed_at AS LastChnagedAt ).

  ENDMETHOD.

  METHOD getBookSupplDetails.

    DELETE FROM zdb_sfbook_suppl.

    INSERT zdb_sfbook_suppl
        FROM ( SELECT FROM /dmo/book_suppl
                FIELDS
                   travel_id AS TravelId,
                   booking_id AS BookingId,
                   booking_supplement_id AS BookingSupplementId,
                   supplement_id AS SupplementId,
                   price AS Price,
                   currency_code AS CurrencyCode ).

  ENDMETHOD.

  METHOD getFlightDetails.

    DELETE FROM zdb_sflight.

    INSERT zdb_sflight
        FROM ( SELECT FROM /dmo/flight
                FIELDS
                  carrier_id     AS Carrierid,
                  connection_id  AS ConnectionId,
                  flight_date    AS FlightDate,
                  price          AS Price,
                  currency_code  AS CurrencyCode,
                  plane_type_id  AS PlaneTypeId,
                  seats_max      AS SeatMax,
                  seats_occupied AS  SeatMaxOcc ).

  ENDMETHOD.

  METHOD getAgencyDetails.

    DELETE FROM zdb_sfagency.

    INSERT zdb_sfagency
        FROM ( SELECT FROM /dmo/agency
                FIELDS
                  agency_id AS AgencyId,
                  name AS AgencyName,
                  street AS Street,
                  postal_code AS PostalCode,
                  city AS City,
                  country_code AS CountryCode,
                  phone_number AS AgencyPhoneNumber,
                  email_address AS AgencyEmailAddress,
                  web_address AS WebsiteAddress,
                  attachment AS Attachment,
                  mime_type AS MimeType,
                  filename AS FileName,
                  local_created_by AS LocalCreatedBy,
                  local_created_at AS LocalCreatedAt,
                  local_last_changed_by AS LocalLastChangedBy,
                  local_last_changed_at AS LocalLastChangedAt,
                  last_changed_at AS LastChangedAt ).

  ENDMETHOD.


ENDCLASS.
