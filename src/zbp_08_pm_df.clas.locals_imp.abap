CLASS lhc_z08_pm_df DEFINITION INHERITING FROM cl_abap_behavior_handler.
PUBLIC SECTION.
 CLASS-DATA:
      gt_create TYPE TABLE OF zpm_order1,
      gt_update TYPE TABLE OF zpm_order1,
      gt_delete TYPE TABLE OF zpm_order1.
  PRIVATE SECTION.





    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR z08_pm_df RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR z08_pm_df RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE z08_pm_df.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE z08_pm_df.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE z08_pm_df.

    METHODS read FOR READ
      IMPORTING keys FOR READ z08_pm_df RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK z08_pm_df.

ENDCLASS.

CLASS lhc_z08_pm_df IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD create.


 DATA ls_order TYPE zpm_order1.

  LOOP AT entities INTO DATA(ls_entity).

    CLEAR ls_order.

    ls_order-client      = '100'.
    ls_order-order_id    = ls_entity-OrderId.
    ls_order-order_type  = ls_entity-OrderType.
    ls_order-description = ls_entity-Description.
    ls_order-plant       = ls_entity-Plant.
    ls_order-equipment   = ls_entity-Equipment.
    ls_order-created_by  = ls_entity-CreatedBy.
    ls_order-created_on  = ls_entity-CreatedOn.

    APPEND ls_order TO gt_create.

  ENDLOOP.

  ENDMETHOD.

  METHOD update.

DATA ls_order TYPE zpm_order1.

  LOOP AT entities INTO DATA(ls_entity).

    ls_order-order_id    = ls_entity-OrderId.
    ls_order-order_type  = ls_entity-OrderType.
    ls_order-description = ls_entity-Description.
    ls_order-plant       = ls_entity-Plant.
    ls_order-equipment   = ls_entity-Equipment.

    APPEND ls_order TO gt_update.

  ENDLOOP.


  ENDMETHOD.

  METHOD delete.

  DATA ls_order TYPE zpm_order1.

  LOOP AT keys INTO DATA(ls_key).

    ls_order-order_id = ls_key-OrderId.

    APPEND ls_order TO gt_delete.

  ENDLOOP.



  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_Z08_PM_DF DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_Z08_PM_DF IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.

* Create records

  MODIFY zpm_order1 FROM TABLE @lhc_z08_pm_df=>gt_create.

* Update records

  LOOP AT lhc_z08_pm_df=>gt_update INTO DATA(ls_update).

    UPDATE zpm_order1
      SET order_type  = @ls_update-order_type,
          description = @ls_update-description,
          plant       = @ls_update-plant,
          equipment   = @ls_update-equipment
      WHERE order_id  = @ls_update-order_id.

  ENDLOOP.

* Delete records

  LOOP AT lhc_z08_pm_df=>gt_delete INTO DATA(ls_delete).

    DELETE FROM zpm_order1
      WHERE order_id = @ls_delete-order_id.

  ENDLOOP.

  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
