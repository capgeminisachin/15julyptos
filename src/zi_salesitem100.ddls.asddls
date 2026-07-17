@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales item interface view 3 june'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_SalesItem100
  as select from zsalesitem100
  association to parent ZI_SalesHdr100 as _SalesHdr on $projection.Salesorderuuid = _SalesHdr.Salesorderuuid
{
  key salesitemuuid          as Salesitemuuid,
      salesorderuuid         as Salesorderuuid,
      salesorderitem         as Salesorderitem,
      salesorderitemcategory as Salesorderitemcategory,
      salesorderitemtext     as Salesorderitemtext,
      material               as Material,
      plant                  as Plant,
      @Semantics.quantity.unitOfMeasure: 'Orderquantityunit'
      orderquantity          as Orderquantity,
      orderquantityunit      as Orderquantityunit,

      @Semantics.user.createdBy: true
      createdbyuser          as Createdbyuser,
      @Semantics.systemDateTime.createdAt: true
      creationat             as Creationat,

      @Semantics.systemDateTime.lastChangedAt: true
      lastchangedat          as Lastchangedat,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      locallastchangedat     as Locallastchangedat,
      _SalesHdr
}
