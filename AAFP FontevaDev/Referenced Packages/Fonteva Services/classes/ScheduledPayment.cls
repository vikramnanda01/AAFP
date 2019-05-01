/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class ScheduledPayment extends FDService.WrapperBase {
    @AuraEnabled
    global Decimal amount;
    @AuraEnabled
    global Id id;
    @AuraEnabled
    global Id invoice;
    @AuraEnabled
    global Boolean isProcessed;
    @AuraEnabled
    global String name;
    @AuraEnabled
    global Id paymentMethod;
    @AuraEnabled
    global Date processedDate;
    @AuraEnabled
    global Date scheduledDate;
    @AuraEnabled
    global Id subscription;
    @AuraEnabled
    global Id term;
    global ScheduledPayment() {

    }
    global static FDService.ScheduledPayment getInstance() {
        return null;
    }
    global static FDService.ScheduledPayment getInstance(OrderApi__Scheduled_Payment__c scheduledPayment) {
        return null;
    }
    global static List<FDService.ScheduledPayment> getInstance(List<OrderApi__Scheduled_Payment__c> scheduledPaymentObjs) {
        return null;
    }
    global static List<FDService.ScheduledPayment> getInstance(List<OrderApi__Scheduled_Payment__c> scheduledPaymentObjs, String className) {
        return null;
    }
}
