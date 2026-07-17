@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds for action test'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zcds_action_15june
  as select from zaction_15june
  //composition of target_data_source_name as _association_name
{
  key name1   as Name1,
      status1 as Status1,
      timestamp1 as timestamp1
      //    _association_name // Make association public
}
