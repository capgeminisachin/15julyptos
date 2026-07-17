@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Fields added, not extension'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS2JUNE_additionalfields
  as select from ZCDS2JUNE as _cds1
  association [1..*] to ZBTP_VIEW as _cds2 on  _cds1.AgencyId = _cds2.AgencyId
                                           and _cds1.TravelId = _cds2.TravelId
{
  key _cds1.AgencyId,
  key _cds1.TravelId,
      _cds1.Description,
      _cds1.CustomerId,
      _cds1.BeginDate,
      _cds1.EndDate,
      _cds2.ChangedAt,
      _cds2.ChangedBy,
      _cds2.Status
}
