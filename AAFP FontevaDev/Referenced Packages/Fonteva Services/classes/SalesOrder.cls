/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SalesOrder extends FDService.WrapperBase {
    @AuraEnabled
    global Id account;
    @AuraEnabled
    global Id businessGroup;
    @AuraEnabled
    global Id contact;
    @AuraEnabled
    global String currencyISOCode;
    @AuraEnabled
    global String entity;
    @AuraEnabled
    global Id id;
    @AuraEnabled
    global Date invoiceDate;
    @AuraEnabled
    global Boolean isClosed;
    @AuraEnabled
    global Boolean isMultiCurrencyOrg;
    @AuraEnabled
    global Boolean isPendingPayment;
    @AuraEnabled
    global Boolean isPosted;
    @AuraEnabled
    global List<FDService.SalesOrderLine> lines;
    @AuraEnabled
    global String paymentGateway;
    @AuraEnabled
    global String paymentTerms;
    @AuraEnabled
    global String postingEntity;
    @AuraEnabled
    global Id sourceCode;
    @AuraEnabled
    global String status;
    @AuraEnabled
    global Decimal total;
    global SalesOrder() {

    }
    global override virtual void fromSObject(SObject salesOrderObj) {

    }
    global static FDService.SalesOrder getInstance() {
        return null;
    }
    global static FDService.SalesOrder getInstance(OrderApi__Sales_Order__c so) {
        return null;
    }
    global static List<FDService.SalesOrder> getInstance(List<OrderApi__Sales_Order__c> sos) {
        return null;
    }
    global override virtual SObject toSObject() {
        return null;
    }
}
