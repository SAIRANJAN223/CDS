@EndUserText.label: 'Database for Error code Sai'
@AccessControl.authorizationCheck: #CHECK
define view entity ZI_SERROR_CODE
  as select from ZDB_SERROR_CODE
  association to parent ZI_SERROR_CODE_S as _DatabaseForErrorAll on $projection.SingletonID = _DatabaseForErrorAll.SingletonID
  composition [0..*] of ZI_SERROR_DESC as _DatabaseForErroText
{
  key ERROR_CODE as ErrorCode,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  1 as SingletonID,
  _DatabaseForErrorAll,
  _DatabaseForErroText
  
}
