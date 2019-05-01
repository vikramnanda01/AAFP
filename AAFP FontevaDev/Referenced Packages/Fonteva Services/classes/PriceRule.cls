/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class PriceRule extends FDService.WrapperBase {
    @AuraEnabled
    global String currencyISOCode;
    @AuraEnabled
    global String id;
    @AuraEnabled
    global Boolean isActive;
    @AuraEnabled
    global Boolean isDefault;
    @AuraEnabled
    global Boolean isMultiCurrency;
    @AuraEnabled
    global Boolean isPromotionalPrice;
    @AuraEnabled
    global String item;
    @AuraEnabled
    global String name;
    @AuraEnabled
    global Decimal price;
    @AuraEnabled
    global Decimal taxInclusivePrice;
    global PriceRule() {

    }
    global override virtual void fromSObject(SObject priceRuleObj) {

    }
    global static FDService.PriceRule getInstance() {
        return null;
    }
    global static FDService.PriceRule getInstance(OrderApi__Price_Rule__c priceRuleObj) {
        return null;
    }
    global static List<FDService.PriceRule> getInstance(List<OrderApi__Price_Rule__c> priceRuleObjs) {
        return null;
    }
    global static List<FDService.PriceRule> getInstance(List<OrderApi__Price_Rule__c> priceRuleObjs, String className) {
        return null;
    }
    global override virtual SObject toSObject() {
        return null;
    }
}
