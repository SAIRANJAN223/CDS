@EndUserText.label: 'Maintain Database for Error code Sai'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_SERROR_CODE
  as projection on ZI_SERROR_CODE
{
  key ErrorCode,
  LastChangedAt,
  @Consumption.hidden: true
  LocalLastChangedAt,
  @Consumption.hidden: true
  SingletonID,
  _DatabaseForErrorAll : redirected to parent ZC_SERROR_CODE_S,
  _DatabaseForErroText : redirected to composition child ZC_SERROR_DESC,
  _DatabaseForErroText.Description : localized
  
}
