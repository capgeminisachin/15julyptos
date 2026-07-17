CLASS lhc_zcds_action_15june DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zcds_action_15june RESULT result.
    METHODS accept FOR MODIFY
      IMPORTING keys   FOR ACTION zcds_action_15june~accept
      RESULT    result
      .
    METHODS reject FOR MODIFY
      IMPORTING keys FOR ACTION zcds_action_15june~reject RESULT result.


ENDCLASS.

CLASS lhc_zcds_action_15june IMPLEMENTATION.

  METHOD get_global_authorizations.

    result-%create = if_abap_behv=>auth-allowed.
    result-%update = if_abap_behv=>auth-allowed.
    result-%delete = if_abap_behv=>auth-allowed.
  ENDMETHOD.

  METHOD accept.

    READ ENTITIES OF zcds_action_15june IN LOCAL MODE
    ENTITY zcds_action_15june
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lv_record).

    DATA(ls_Record) = lv_record[ 1 ].

    MODIFY ENTITIES OF zcds_action_15june IN LOCAL MODE
    ENTITY zcds_action_15june
    UPDATE FIELDS ( Status1 )
    WITH VALUE #( ( Name1 = ls_Record-Name1 Status1 = 'Approved' ) ).






  ENDMETHOD.

  METHOD reject.


    READ ENTITIES OF zcds_action_15june IN LOCAL MODE
    ENTITY zcds_action_15june
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lv_record).

    DATA(ls_Record) = lv_record[ 1 ].

    MODIFY ENTITIES OF zcds_action_15june IN LOCAL MODE
    ENTITY zcds_action_15june
    UPDATE FIELDS ( Status1 )
    WITH VALUE #( ( Name1 = ls_Record-Name1 Status1 = 'Rejected' ) ).

  ENDMETHOD.




ENDCLASS.
