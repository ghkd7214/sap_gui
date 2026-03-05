@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'R_Department'
@Metadata.ignorePropagatedAnnotations: true
define view entity z07_r_department
  as select from zg07_depment
  association [0..*] to z07_R_Employee as _Employee  on $projection.Id = _Employee.DepartmentId
  association [0..1] to z07_R_Employee as _Head      on $projection.DepartmentHead = _Head.DepartmentId
  association [0..1] to z07_R_Employee as _Assistant on $projection.DepartmentAssisant = _Assistant.DepartmentId
{
  key id                    as Id,
      description           as Description,
      department_head       as DepartmentHead,
      department_assisant   as DepartmentAssisant,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,
      _Head,
      _Assistant
}
