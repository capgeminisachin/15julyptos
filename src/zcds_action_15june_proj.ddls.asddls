@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zcds_action_15june_proj provider contract transactional_query
 as projection on zcds_action_15june
{
    key Name1,
    Status1, 
    timestamp1
}
