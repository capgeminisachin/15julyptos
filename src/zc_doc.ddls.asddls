@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Document Projection View'
@Metadata.allowExtensions: true
define root view entity ZC_Doc
  provider contract transactional_query
  as projection on zr_doc
{
  key DocUuid,
      DocId,
      DocTitle,

      @Semantics.largeObject: {
        mimeType: 'MimeType',
        fileName: 'FileName',
        contentDispositionPreference: #INLINE
      }
      Attachment,

      @Semantics.mimeType: true
      MimeType,

      FileName,

      CreatedBy,
      CreatedAt,
      ChangedBy,
      ChangedAt
}
