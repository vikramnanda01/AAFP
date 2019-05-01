/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class PaymentMethod extends FDService.WrapperBase {
    @AuraEnabled
    global String cardType;
    @AuraEnabled
    global Id contact;
    @AuraEnabled
    global String description;
    @AuraEnabled
    global Id id;
    @AuraEnabled
    global Boolean isActive;
    @AuraEnabled
    global Boolean isValid;
    @AuraEnabled
    global String lastFourDigits;
    @AuraEnabled
    global String name;
    @AuraEnabled
    global String paymentMethodType;
    global PaymentMethod() {

    }
    global static FDService.PaymentMethod getInstance() {
        return null;
    }
    global static FDService.PaymentMethod getInstance(OrderApi__Payment_Method__c pm) {
        return null;
    }
    global static List<FDService.PaymentMethod> getInstance(List<OrderApi__Payment_Method__c> paymentMethodObjs) {
        return null;
    }
    global static List<FDService.PaymentMethod> getInstance(List<OrderApi__Payment_Method__c> paymentMethodObjs, String className) {
        return null;
    }
}
