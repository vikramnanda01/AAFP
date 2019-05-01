/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class Receipt extends FDService.WrapperBase {
    @AuraEnabled
    global Decimal appliedAmount;
    @AuraEnabled
    global Decimal balance;
    @AuraEnabled
    global Id epayment;
    @AuraEnabled
    global Id id;
    @AuraEnabled
    global String name;
    @AuraEnabled
    global String paymentMethodDescription;
    @AuraEnabled
    global Date postedDate;
    @AuraEnabled
    global List<FDService.ReceiptLine> receiptLines;
    @AuraEnabled
    global Decimal total;
    global Receipt() {

    }
    global static FDService.Receipt getInstance() {
        return null;
    }
    global static FDService.Receipt getInstance(OrderApi__Receipt__c receipt) {
        return null;
    }
    global static List<FDService.Receipt> getInstance(List<OrderApi__Receipt__c> receiptObjs) {
        return null;
    }
    global static List<FDService.Receipt> getInstance(List<OrderApi__Receipt__c> receiptObjs, String className) {
        return null;
    }
}
