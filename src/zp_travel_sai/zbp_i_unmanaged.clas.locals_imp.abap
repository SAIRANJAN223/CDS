CLASS lhc_zi_unmanaged DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_unmanaged RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zi_unmanaged.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zi_unmanaged.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zi_unmanaged.

    METHODS read FOR READ
      IMPORTING keys FOR READ zi_unmanaged RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zi_unmanaged.

ENDCLASS.

CLASS lhc_zi_unmanaged IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_UNMANAGED DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_UNMANAGED IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
