@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZI_TRAVEL_SAI'
@ObjectModel.semanticKey: [ 'TravelID' ]
@Search.searchable: true
define root view entity ZC_TRAVEL_SAI
  provider contract transactional_query
  as projection on ZI_TRAVEL_SAI
{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
  key TravelID,
      
      AgencyID,
      
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['AgencyName']
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Agency', element: 'AgencyID' } }]
      _Agency.Name              as AgencyName,
      
      CustomerID,
      
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['CustomerName']
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Customer', element: 'CustomerID'  } }]
      _Customer.LastName        as CustomerName,
      
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      
      @Consumption.valueHelpDefinition: [{ entity: {name: 'I_Currency', element: 'Currency' } }]
      CurrencyCode,
      
      Description,
      OverallStatus,
      
      @ObjectModel.text.element: ['OverallStatusText']
      @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Overall_Status_VH', element: 'OverallStatus' } }]
      _OverallStatus._Text.Text as OverallStatusText : localized,
      
      Attachment,
      MimeType,
      FileName,
      LocalLastChangedAt

}
