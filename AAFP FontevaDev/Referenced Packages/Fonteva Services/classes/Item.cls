/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class Item extends FDService.WrapperBase {
    @AuraEnabled
    global String assignmentInstructions;
    @AuraEnabled
    global String assignmentsDisplayLabel;
    @AuraEnabled
    global String currencyISOCode;
    @AuraEnabled
    global String description;
    @AuraEnabled
    global Boolean disablePriceRules;
    @AuraEnabled
    global String displayName;
    @AuraEnabled
    global Boolean enableAssignments;
    @AuraEnabled
    global Boolean enableCancellationRequest;
    @AuraEnabled
    global String eStoreDescription;
    @AuraEnabled
    global String eStoreShortDescription;
    @AuraEnabled
    global Id form;
    @AuraEnabled
    global String id;
    @AuraEnabled
    global List<String> images;
    @AuraEnabled
    global String imageUrl;
    @AuraEnabled
    global String interviewFormDisplayLabel;
    @AuraEnabled
    global String inventoryMessage;
    @AuraEnabled
    global Boolean isContribution;
    @AuraEnabled
    global Boolean isMultiCurrency;
    @AuraEnabled
    global Boolean isSubscription;
    @AuraEnabled
    global Boolean isTaxable;
    @AuraEnabled
    global Id itemClass;
    @AuraEnabled
    global List<FDService.PackageItem> itemPackageItems;
    @AuraEnabled
    global String lineDescription;
    @AuraEnabled
    global String name;
    @AuraEnabled
    global Decimal price;
    @AuraEnabled
    global List<FDService.PriceRule> priceRules;
    @AuraEnabled
    global Id renewalForm;
    @AuraEnabled
    global Boolean requireAssignments;
    @AuraEnabled
    global List<FDService.SubscriptionPlan> subscriptionPlans;
    @AuraEnabled
    global Id taxClass;
    global Item() {

    }
    global override virtual void fromSObject(SObject itemObj) {

    }
    global override virtual Object getFieldValueFromSObject(String fieldName) {
        return null;
    }
    global static FDService.Item getInstance() {
        return null;
    }
    global static FDService.Item getInstance(OrderApi__Item__c itemObj) {
        return null;
    }
    global static FDService.Item getInstance(OrderApi__Item__c itemObj, String className) {
        return null;
    }
    global static List<FDService.Item> getInstance(List<OrderApi__Item__c> itemObjs) {
        return null;
    }
    global static List<FDService.Item> getInstance(List<OrderApi__Item__c> itemObjs, String className) {
        return null;
    }
    global override virtual SObject toSObject() {
        return null;
    }
}
