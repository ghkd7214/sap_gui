//@AbapCatalog.viewEnhancementCategory: [#NONE]
@AbapCatalog: { viewEnhancementCategory: [ #NONE ],
                dataMaintenance: #RESTRICTED }
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee (Consumption)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel: { usageType: { dataClass: #MASTER,
                             sizeCategory: #M,
                             serviceQuality: #D } }
define view entity zg00_c_employee as select from zg00_r_employee
{
    key EmployeeId,
    FirstName,
    LastName,
    BirthDate,
    EntryDate,
    DepartmentId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    AnnualSalary,
    CurrencyCode,
    CreatedBy,
    CreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt
}
