@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS entity view for Customer'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CDS_VIEW_ENTITY as select from zdb_sfcustomer
{
   key customer_id as CustomerId,
   first_name as FirstName,
   last_name as LastName,
   title as Title,
   street as Street,
   postal_code as PostalCode,
   city as City,
   country_code as CountryCode,
   phone_number as PhoneNumber,
   email_address as EmailAddress
   
}
