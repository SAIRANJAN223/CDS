CLASS zcl_hello_world_sai DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS ZCL_HELLO_WORLD_SAI IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    out->write( |Hello world! ({ cl_abap_context_info=>GET_USER_ALIAS( ) }) | ).
  ENDMETHOD.
ENDCLASS.
