@EndUserText.label: 'Maintain Database for Error code Sai Tex'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_SERROR_DESC
  as projection on ZI_SERROR_DESC
{
  @ObjectModel.text.element: [ 'LanguageName' ]
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: 'I_Language', 
      element: 'Language'
    }
  } ]
  key Langu,
  key ErrorCode,
  Description,
  @Consumption.hidden: true
  LocalLastChangedAt,
  @Consumption.hidden: true
  SingletonID,
  _LanguageText.LanguageName : localized,
  _DatabaseForErrorCod : redirected to parent ZC_SERROR_CODE,
  _DatabaseForErrorAll : redirected to ZC_SERROR_CODE_S
  
}
