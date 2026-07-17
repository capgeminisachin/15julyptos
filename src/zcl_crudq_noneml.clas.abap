CLASS zcl_crudq_noneml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_crudq_noneml IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


"   DATA itab TYPE TABLE OF zsaleshdr100.
" * fill internal travel table (itab)
" itab = VALUE #(
"  ( salesorderuuid = '02D5290E594C1EDA93815057FD946624' salesorder = '1000000001' salesordertype = 'OR' description = 'iPhone'
"  soldtoparty = 'Demo_user1' salesorganization = '0001' distributionchannel = '01' documentreason = '1'
"  createdbyuser
" = 'USER1' creationat = '20190613111129.2391370'
"  lastchangedat = '20190711140753.1472620' locallastchangedat = '20190711140753.1472620' )
"  ( salesorderuuid = '02D5290E594C1EDA93815057FD946625' salesorder = '1000000002' salesordertype = 'OR' description = 'Lenevo Laptop'
"  soldtoparty = 'Demo_user2' salesorganization = '0001' distributionchannel = '01' documentreason = '1'
"  createdbyuser
" = 'USER1' creationat = '20190713111129.2391370'
"  lastchangedat = '20190713111129.2391370' locallastchangedat = '20190713111129.2391370' )
" ).
" * delete existing entries in the database table
" DELETE FROM zsaleshdr10.
" IF sy-subrc = 0.
" ENDIF.
" * insert the new table entries
" INSERT zsaleshdr100 FROM TABLE @itab.
" IF sy-subrc = 0.
" ENDIF.



*
*  DATA itabitem TYPE TABLE OF zsalesitem100.
*
*  itabitem = VALUE #(
* ( salesitemuuid = '12D5290E594C1EDA93815057FD946624' salesorderuuid =
*'02D5290E594C1EDA93815057FD946624'
* salesorderitem = '00010' salesorderitemcategory = 'TAQB' salesorderitemtext = 'iphone' material = '1110000980'
* plant = '010' orderquantity = '1' orderquantityunit = 'EA'
* createdbyuser = 'USER1' creationat = '+20190613111129'
* lastchangedat = '20190711140753.1472620' locallastchangedat = '20190711140753.1472620' )
* ( salesitemuuid = '12D5290E594C1EDA93815057FD946625' salesorderuuid =
*'02D5290E594C1EDA93815057FD946625'
* salesorderitem = '00010' salesorderitemcategory = 'TAQB' salesorderitemtext = 'Lenevo Laptop' material = '1110000980'
* plant = '010' orderquantity = '1' orderquantityunit = 'EA'
* createdbyuser = 'USER1' creationat = '20190613111129.2391370'
* lastchangedat = '20190711140753.1472620' locallastchangedat = '20190711140753.1472620' )
* ).
*
** delete existing entries in the database table
*DELETE FROM zsalesitem100.
*
** insert the new table entries
*INSERT zsalesitem100 FROM TABLE @itabitem.
*IF sy-subrc = 0.
*ENDIF.

out->write( 'Hello World' ).




  ENDMETHOD.
ENDCLASS.
