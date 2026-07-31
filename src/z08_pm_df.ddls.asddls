@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'root view entity for pm order'
@Metadata.ignorePropagatedAnnotations: true
define root view entity z08_pm_df 
as select from zpm_order1
{
    
key order_id    as OrderId,

      order_type  as OrderType,
      description as Description,
      plant       as Plant,
      equipment   as Equipment,
      created_by  as CreatedBy,
      created_on  as CreatedOn
    
 
}
