@AbapCatalog.sqlViewName: 'ZCDSEX9G07'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '엑서사이즈 9'
@Metadata.ignorePropagatedAnnotations: true
@OData.publish: true
define view ZCDS_EX9_G07 as select from SEPM_I_SalesOrder 
{
    @UI.facet: [
        {
            id: 'COLLFAC1',
            label: 'General Information',
            type: #COLLECTION,
            position: 10
        },
        {
            label: 'General Information',
            type: #IDENTIFICATION_REFERENCE,
            parentId: 'COLLFAC1',
            position: 10
        }
    ]
    @UI.lineItem. position: 10
    @UI.identification.position: 10
    key SalesOrder,
    @UI.lineItem. position: 20
    @UI.identification.position: 20
    _Customer.BusinessPartner as CustomerID,
    @UI.lineItem. position: 30
    @UI.identification.position: 30
    _Customer.CompanyName as CustomerName,
    @UI.lineItem. position: 40
    @UI.identification.position: 40
    GrossAmountInTransacCurrency as GrossAmount,
    @UI.lineItem. position: 50
    NetAmountInTransactionCurrency as NetAmount,
    @UI.lineItem. position: 60
    SalesOrderOverallStatus as OverallStatus,
    @UI.lineItem. position: 70
    SalesOrderPaymentMethod as PaymentMethod,
    @UI.hidden: true
    TransactionCurrency as Currency
}
