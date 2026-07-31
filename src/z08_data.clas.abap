CLASS z08_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
     INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z08_data IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

  DATA:
      lt_order TYPE TABLE OF zpm_order1,
      ls_order TYPE zpm_order1.

* Record 1
    ls_order-client      = '100'.
    ls_order-order_id    = '1001'.
    ls_order-order_type  = 'PM01'.
    ls_order-description = 'Pump Repair'.
    ls_order-plant       = '1000'.
    ls_order-equipment   = 'EQ001'.
    ls_order-created_by  = 'MADHAVI'.
    ls_order-created_on  = '20250101'.
    APPEND ls_order TO lt_order.

* Record 2
    CLEAR ls_order.
    ls_order-client      = '100'.
    ls_order-order_id    = '1002'.
    ls_order-order_type  = 'PM02'.
    ls_order-description = 'Motor Replacement'.
    ls_order-plant       = '1000'.
    ls_order-equipment   = 'EQ002'.
    ls_order-created_by  = 'MADHAVI'.
    ls_order-created_on  = '20250105'.
    APPEND ls_order TO lt_order.

* Record 3
    CLEAR ls_order.
    ls_order-client      = '100'.
    ls_order-order_id    = '1003'.
    ls_order-order_type  = 'PM03'.
    ls_order-description = 'Valve Leakage'.
    ls_order-plant       = '1000'.
    ls_order-equipment   = 'EQ003'.
    ls_order-created_by  = 'MADHAVI'.
    ls_order-created_on  = '20250110'.
    APPEND ls_order TO lt_order.

* Record 4
    CLEAR ls_order.
    ls_order-client      = '100'.
    ls_order-order_id    = '1004'.
    ls_order-order_type  = 'PM04'.
    ls_order-description = 'Bearing Failure'.
    ls_order-plant       = '1000'.
    ls_order-equipment   = 'EQ004'.
    ls_order-created_by  = 'MADHAVI'.
    ls_order-created_on  = '20250115'.
    APPEND ls_order TO lt_order.

* Record 5
    CLEAR ls_order.
    ls_order-client      = '100'.
    ls_order-order_id    = '1005'.
    ls_order-order_type  = 'PM05'.
    ls_order-description = 'Pump Inspection'.
    ls_order-plant       = '1000'.
    ls_order-equipment   = 'EQ005'.
    ls_order-created_by  = 'MADHAVI'.
    ls_order-created_on  = '20250120'.
    APPEND ls_order TO lt_order.

    INSERT zpm_order1 FROM TABLE @lt_order.

    COMMIT WORK.

  ENDMETHOD.

ENDCLASS.




