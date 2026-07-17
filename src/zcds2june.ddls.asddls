@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS for extention view check'
//@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions : true
//@Search.searchable: true
define view entity ZCDS2JUNE
  as select from ZBTP_VIEW
{
      @EndUserText.label: 'Agency ID number from cds'
  key AgencyId,
      @EndUserText.label: 'TravelIDnumber'
  key TravelId,
      Description,
      CustomerId,
      BeginDate,
      EndDate

}
