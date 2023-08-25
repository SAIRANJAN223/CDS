@EndUserText.label: 'Maintain Database for Error code Sai Sin'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZC_SERROR_CODE_S
  provider contract transactional_query
  as projection on ZI_SERROR_CODE_S
{
  key SingletonID,
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _DatabaseForErrorCod : redirected to composition child ZC_SERROR_CODE
  
}
