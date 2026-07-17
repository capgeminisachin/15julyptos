@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Search help'
@Search.searchable: true
@ObjectModel.dataCategory: #VALUE_HELP
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSHCDS
  as select from zbtp002
{
  @Search.defaultSearchElement: true
  agency_id
}
