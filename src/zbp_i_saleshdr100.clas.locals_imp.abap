*CLASS lsc_zi_saleshdr100 DEFINITION INHERITING FROM cl_abap_behavior_saver.
*
*  PROTECTED SECTION.
*
*    METHODS save_modified REDEFINITION.
*
*ENDCLASS.
*
*CLASS lsc_zi_saleshdr100 IMPLEMENTATION.
*
*  METHOD save_modified.
*  ENDMETHOD.
*
*ENDCLASS.

CLASS lhc_SalesHdr DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR SalesHdr RESULT result.
    METHODS valproduct FOR VALIDATE ON SAVE
      IMPORTING keys FOR saleshdr~valproduct.
    METHODS detproduct FOR DETERMINE ON MODIFY
      IMPORTING keys FOR saleshdr~detproduct.

ENDCLASS.

CLASS lhc_SalesHdr IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD valProduct.

    READ ENTITIES OF ZI_SalesHdr100
    ENTITY SalesHdr
    ALL FIELDS WITH CORRESPONDING #( keys  )
    RESULT DATA(lt_result)
    FAILED DATA(lt_failed).

    LOOP AT lt_result ASSIGNING FIELD-SYMBOL(<lt_fs_wa>).
      IF <lt_fs_wa>-Distributionchannel CP 'DD'.
        APPEND VALUE #(
            salesorderuuid = <lt_fs_wa>-salesorderuuid
        ) TO failed-saleshdr.

        APPEND VALUE #(
            salesorderuuid = <lt_fs_wa>-salesorderuuid
            %element-description = if_abap_behv=>mk-on " Highlights the 'Description' field in red
            %msg = new_message_with_text(
                     severity = if_abap_behv_message=>severity-error
                     text     = 'No doordarshan or something' " Direct string text
                   )
        ) TO reported-saleshdr.

      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD detProduct.

    READ ENTITIES OF ZI_SalesHdr100
    ENTITY SalesHdr
     FIELDS ( Distributionchannel ) WITH CORRESPONDING #( keys )
    RESULT DATA(lt_result2)
    FAILED DATA(lt_failed2).

    LOOP AT lt_result2 INTO DATA(lwa_result1).
      IF lwa_result1-Distributionchannel EQ 'DD'.
        lwa_result1-Soldtoparty = 'DEMO3'.
        MODIFY ENTITIES OF ZI_SalesHdr100
           ENTITY SalesHdr
           UPDATE FIELDS ( Soldtoparty )
           WITH VALUE #( (
                     salesorderuuid      = lwa_result1-salesorderuuid
                     Soldtoparty = lwa_result1-Soldtoparty
                     %control-Soldtoparty = if_abap_behv=>mk-on
                 ) )
                 FAILED DATA(lt_failed_modify)
                 REPORTED DATA(lt_reported_modify).

*                 failed-saleshdr   = CORRESPONDING #( BASE ( failed-saleshdr ) lt_failed_modify-saleshdr ).
        reported-saleshdr = CORRESPONDING #( BASE ( reported-saleshdr ) lt_reported_modify-saleshdr ).

      ENDIF.
    ENDLOOP.



*    MODIFY ENTITIES OF ZI_SalesHdr100
*    ENTITY SalesHdr
*    UPDATE FIELDS ( Soldtoparty )
*    WITH VALUE #( (
*              salesorderuuid      = lwa_result1-salesorderuuid
*              Soldtoparty = lwa_result1-Soldtoparty
*              %control-Soldtoparty = if_abap_behv=>mk-on
*          ) )
*          FAILED DATA(lt_failed_modify)
*          REPORTED DATA(lt_reported_modify).



  ENDMETHOD.

ENDCLASS.
