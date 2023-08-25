CLASS zcl_fill_bank_account_sai DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fill_bank_account_sai IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: lt_accounts TYPE TABLE OF zdb_sbank_act.

    "read current timestamp
    GET TIME STAMP FIELD DATA(lv_tsl).

    "fill internal table
    lt_accounts = VALUE #(

        ( client ='100' account_number ='00000001' bank_customer_id ='100001' bank_name ='Volksbank' city = 'Gaertringen' balance ='200.00 ' currency ='EUR' account_category ='01' lastchangedat = lv_tsl )
        ( client ='100' account_number ='00000002' bank_customer_id ='200002' bank_name ='Sparkasse' city ='Schwetzingen' balance ='500.00 ' currency ='EUR' account_category ='02' lastchangedat = lv_tsl )
        ( client ='100' account_number ='00000003' bank_customer_id ='200003' bank_name ='Commerzbank' city ='Nuernberg' balance ='150.00 ' currency ='EUR' account_category ='02' lastchangedat = lv_tsl )
    ).

    "Delete possible entries; insert new entries
    DELETE FROM zdb_sbank_act.

    INSERT zdb_sbank_act FROM TABLE @lt_accounts.

    "Check result in console
    out->write( sy-dbcnt ).
    out->write(  'DONE!' ).


  ENDMETHOD.

ENDCLASS.
