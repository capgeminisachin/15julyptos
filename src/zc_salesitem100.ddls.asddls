@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view 3 june item table'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_SALESITEM100 as projection on ZI_SalesItem100
{
    key Salesitemuuid,
    Salesorderuuid,
    Salesorderitem,
    Salesorderitemcategory,
    Salesorderitemtext,
    Material,
    Plant,
    @Semantics.quantity.unitOfMeasure: 'Orderquantityunit'
    Orderquantity,
    Orderquantityunit,
    Createdbyuser,
    Creationat,
    Lastchangedat,
    Locallastchangedat,
    /* Associations */
    _SalesHdr : redirected to parent ZC_SALESHDR100
}
