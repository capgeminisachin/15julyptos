@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds to associate 2 table, interface'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zi18junecds as select from zi18june as header
association [1..1] to zi18june2 as _item on header.empname = _item.empname
{
    key header.empname,
//    _association_name // Make association public
_item.empid
}
