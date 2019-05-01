/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class ReceiptLine extends FDService.WrapperBase {
    @AuraEnabled
    global Id id;
    @AuraEnabled
    global Id invoice;
    @AuraEnabled
    global Id invoiceLine;
    @AuraEnabled
    global Id item;
    @AuraEnabled
    global String name;
    @AuraEnabled
    global Decimal quantity;
    @AuraEnabled
    global Id receipt;
    @AuraEnabled
    global Decimal salePrice;
    @AuraEnabled
    global Decimal total;
    global ReceiptLine() {

    }
    global static FDService.ReceiptLine getInstance() {
        return null;
    }
    global static FDService.ReceiptLine getInstance(OrderApi__Receipt_Line__c receiptLine) {
        return null;
    }
    global static List<FDService.ReceiptLine> getInstance(List<OrderApi__Receipt_Line__c> receiptLineObjs) {
        return null;
    }
    global static List<FDService.ReceiptLine> getInstance(List<OrderApi__Receipt_Line__c> receiptLineObjs, String className) {
        return null;
    }
}
