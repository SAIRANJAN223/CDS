@EndUserText.label: 'Database for Error code Sai Text'
@AccessControl.authorizationCheck: #CHECK
@ObjectModel.dataCategory: #TEXT
define view entity ZI_SERROR_DESC
  as select from ZDB_SERROR_DESC
  association [1..1] to ZI_SERROR_CODE_S as _DatabaseForErrorAll on $projection.SingletonID = _DatabaseForErrorAll.SingletonID
  association to parent ZI_SERROR_CODE as _DatabaseForErrorCod on $projection.ErrorCode = _DatabaseForErrorCod.ErrorCode
  association [0..*] to I_LanguageText as _LanguageText on $projection.Langu = _LanguageText.LanguageCode
{
  @Semantics.language: true
  key LANGU as Langu,
  key ERROR_CODE as ErrorCode,
  @Semantics.text: true
  DESCRIPTION as Description,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  1 as SingletonID,
  _DatabaseForErrorAll,
  _DatabaseForErrorCod,
  _LanguageText
  
}
