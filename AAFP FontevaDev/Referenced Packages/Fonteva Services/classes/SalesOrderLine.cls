/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SalesOrderLine extends FDService.WrapperBase {
    @AuraEnabled
    global Id account;
    @AuraEnabled
    global Date activationDate;
    @AuraEnabled
    global Boolean autoCalculateActivationDate;
    @AuraEnabled
    global Boolean autoRenew;
    @AuraEnabled
    global Id contact;
    @AuraEnabled
    global String CreatedDate;
    @AuraEnabled
    global String currencyISOCode;
    @AuraEnabled
    global Boolean displayItem;
    @AuraEnabled
    global Boolean enableAutoRenew;
    @AuraEnabled
    global Date endDate;
    @AuraEnabled
    global String entity;
    @AuraEnabled
    global Id event;
    global String foreignKey;
    @AuraEnabled
    global Id id;
    @AuraEnabled
    global Boolean incomplete;
    @AuraEnabled
    global Boolean isAmendment;
    @AuraEnabled
    global Boolean isMultiCurrencyOrg;
    @AuraEnabled
    global Boolean isPosted;
    @AuraEnabled
    global Boolean isRenewal;
    @AuraEnabled
    global Boolean isRequiredPackageItem;
    @AuraEnabled
    global Boolean isRequiredScheduleItem;
    @AuraEnabled
    global Boolean isShippingRate;
    @AuraEnabled
    global Boolean isSubscription;
    @AuraEnabled
    global Boolean isTax;
    @AuraEnabled
    global Boolean isValid;
    @AuraEnabled
    global Id item;
    @AuraEnabled
    global String LastModifiedDate;
    @AuraEnabled
    global String lineDescription;
    @AuraEnabled
    global List<FDService.SalesOrderLine> lines;
    @AuraEnabled
    global Decimal listPrice;
    @AuraEnabled
    global String packageItem;
    global String parentForeignKey;
    @AuraEnabled
    global Boolean priceOverride;
    @AuraEnabled
    global Id priceRule;
    @AuraEnabled
    global Integer quantity;
    @AuraEnabled
    global Decimal salePrice;
    @AuraEnabled
    global Id salesOrder;
    @AuraEnabled
    global Id salesOrderLine;
    @AuraEnabled
    global Id scheduleItem;
    @AuraEnabled
    global String shippingMethod;
    @AuraEnabled
    global Id sponsorPackage;
    @AuraEnabled
    global Id subscription;
    @AuraEnabled
    global Id subscriptionPlan;
    @AuraEnabled
    global Date subscriptionStartDate;
    @AuraEnabled
    global Decimal subtotal;
    @AuraEnabled
    global Boolean systemOverride;
    @AuraEnabled
    global Decimal taxPercent;
    @AuraEnabled
    global Id ticketType;
    @AuraEnabled
    global Decimal total;
    global SalesOrderLine() {

    }
    global override virtual void fromSObject(SObject salesOrderLineObj) {

    }
    global static FDService.SalesOrderLine getInstance() {
        return null;
    }
    global static FDService.SalesOrderLine getInstance(OrderApi__Sales_Order_Line__c sol) {
        return null;
    }
    global static List<FDService.SalesOrderLine> getInstance(List<OrderApi__Sales_Order_Line__c> sols) {
        return null;
    }
    global static List<FDService.SalesOrderLine> getInstance(List<OrderApi__Sales_Order_Line__c> sols, String className) {
        return null;
    }
    global override virtual SObject toSObject() {
        return null;
    }
}
