@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_SALESHDR100 as projection on ZI_SalesHdr100
{
    key Salesorderuuid,
    Salesorder,
    Salesordertype,
    Description,
    Salesorganization,
    Soldtoparty,
    Distributionchannel,
    Documentreason,
    Createdbyuser,
    Creationat,
    Lastchangedat,
    Locallastchangedat,
    /* Associations */
    _SalesItem : redirected to composition child ZC_SALESITEM100
}
