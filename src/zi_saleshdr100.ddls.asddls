@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales header interface view'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_SalesHdr100
  as select from zsaleshdr100
  composition [0..*] of ZI_SalesItem100 as _SalesItem
{
  key salesorderuuid      as Salesorderuuid,
      salesorder          as Salesorder,
      salesordertype      as Salesordertype,
      description         as Description,
      salesorganization   as Salesorganization,
      soldtoparty         as Soldtoparty,
      distributionchannel as Distributionchannel,
      documentreason      as Documentreason,

      @Semantics.user.createdBy: true
      createdbyuser       as Createdbyuser,
      @Semantics.systemDateTime.createdAt: true
      creationat          as Creationat,

      @Semantics.systemDateTime.lastChangedAt: true
      lastchangedat       as Lastchangedat,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      locallastchangedat  as Locallastchangedat,
      _SalesItem // Make association public
}
