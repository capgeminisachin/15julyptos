@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS on attachment DDIC'
//@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true


define root view entity zr_doc as select from zdoc_tab
//composition of target_data_source_name as _association_name
{
    key doc_uuid     as DocUuid,
      doc_id       as DocId,
      doc_title    as DocTitle,
      attachment   as Attachment,
      mime_type    as MimeType,
      file_name    as FileName,

      @Semantics.user.createdBy: true
      created_by   as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at   as CreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      changed_by   as ChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      changed_at   as ChangedAt

}
