//@AbapCatalog.viewEnhancementCategory: [#NONE]
//@AbapCatalog.dataMaintenance: #RESTRICTED
@AbapCatalog: { viewEnhancementCategory: [ #NONE ],
                dataMaintenance: #RESTRICTED }
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee'
@Metadata.ignorePropagatedAnnotations: true
//@ObjectModel.usageType.dataClass: #MASTER
//@ObjectModel.usageType.sizeCategory: #M
//@ObjectModel.usageType.serviceQuality: #D
@ObjectModel: { usageType: { dataClass: #MASTER,
                             sizeCategory: #M,
                             serviceQuality: #D } }
define view entity zg00_r_employee as select from zemploy_g00_dep
{
  key employee_id as EmployeeId,
  first_name as FirstName,
  last_name as LastName,
  birth_date as BirthDate,
  entry_date as EntryDate,
  department_id as DepartmentId,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  annual_salary as AnnualSalary,
  currency_code as CurrencyCode,
  created_by as CreatedBy,
  created_at as CreatedAt,
  local_last_changed_by as LocalLastChangedBy,
  local_last_changed_at as LocalLastChangedAt,
  last_changed_at as LastChangedAt  
}
