CLASS zcl_vscode DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_vscode IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
data lvar type c length 10.
lvar = 'variable'.

data lvar2 type table of zcds2june.
  out->write( 'Hello World' )->write( 'This is a test class for VSCode' ).
  ENDMETHOD.
ENDCLASS.
