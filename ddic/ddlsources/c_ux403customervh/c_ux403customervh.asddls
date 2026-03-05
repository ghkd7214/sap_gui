@AbapCatalog.sqlViewName: 'CUX403CUSVH'
@EndUserText: {
    label: 'Value helps for Customer'
}
define view C_UX403CustomerVH as select 
from SEPM_I_BusinessPartner
{
  key BusinessPartner as CustomerID,
  CompanyName as CustomerName,
  PhoneNumber as PhoneNumber,
  @EndUserText: {
      label: 'Created By'
  }
  concat_with_space( _CreatedByUser.FirstName,_CreatedByUser.LastName,1 ) as CreaterFullName
}
where _Role.BusinessPartnerRole = '01'
