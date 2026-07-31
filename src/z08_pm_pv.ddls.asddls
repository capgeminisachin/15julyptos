@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection view of pm order'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity z08_pm_pv
  provider contract transactional_query as projection on z08_pm_df
{
  
 @UI.lineItem: [{ position: 10 }]
  @UI.identification: [{ position: 10 }]
  @UI.selectionField: [{ position: 10 }]
  key OrderId,

  @UI.lineItem: [{ position: 20 }]
  @UI.identification: [{ position: 20 }]
  @UI.selectionField: [{ position: 20 }]
  OrderType,

  @UI.lineItem: [{ position: 30 }]
  @UI.identification: [{ position: 30 }]
  @UI.selectionField: [{ position: 20 }]
  Description,

  @UI.lineItem: [{ position: 40 }]
  @UI.identification: [{ position: 40 }]
  @UI.selectionField: [{ position: 20 }]
  Plant,

  @UI.lineItem: [{ position: 50 }]
  @UI.identification: [{ position: 50 }]
  @UI.selectionField: [{ position: 20 }]
  Equipment,

  @UI.lineItem: [{ position: 60 }]
  @UI.identification: [{ position: 60 }]
  @UI.selectionField: [{ position: 20 }]
  CreatedBy,

  @UI.lineItem: [{ position: 70 }]
  @UI.identification: [{ position: 70 }]
  @UI.selectionField: [{ position: 20 }]
  CreatedOn
  
}
