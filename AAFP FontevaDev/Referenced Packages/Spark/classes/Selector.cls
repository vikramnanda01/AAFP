/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class Selector {
    global String fieldsToString;
    global Selector() {

    }
    global Selector(Schema.SObjectType type) {

    }
    global Selector(Schema.SObjectType type, Schema.FieldSet fieldSet) {

    }
    global Selector(Schema.SObjectType type, Schema.SObjectField lookupField) {

    }
    global Selector(Schema.SObjectType type, List<Schema.FieldSet> fieldSets) {

    }
    global Selector(Schema.SObjectType type, Boolean enableForUpdate) {

    }
    global Selector(Schema.SObjectType type, Integer soqlLimit) {

    }
    global Selector(Schema.SObjectType type, String soqlWhereClause) {

    }
    global Selector(Schema.SObjectType type, Schema.SObjectField lookupField, String soqlFilter) {

    }
    global Selector(Schema.SObjectType type, List<Schema.FieldSet> fieldSets, Schema.SObjectField lookupField) {

    }
    global Selector(Schema.SObjectType type, List<Schema.FieldSet> fieldSets, String soqlFilter) {

    }
    global Selector(Schema.SObjectType type, String soqlWhereClause, Schema.SObjectField lookupField) {

    }
    global Selector(Schema.SObjectType type, String soqlWhereClause, Boolean enableForUpdate) {

    }
    global Selector(Schema.SObjectType type, String soqlWhereClause, Integer soqlLimit) {

    }
    global Selector(Schema.SObjectType type, String soqlWhereClause, String soqlSort) {

    }
    global Selector(Schema.SObjectType type, Schema.SObjectField lookupField, String soqlWhereClause, Integer soqlLimit) {

    }
    global Selector(Schema.SObjectType type, List<Schema.FieldSet> fieldSets, Schema.SObjectField lookupField, String soqlFilter) {

    }
    global Selector(Schema.SObjectType type, String soqlWhereClause, Schema.SObjectField lookupField, Boolean enableForUpdate) {

    }
    global Selector(Schema.SObjectType type, String soqlWhereClause, Integer soqlLimit, Boolean enableForUpdate) {

    }
    global Selector(Schema.SObjectType type, String soqlWhereClause, String soqlSort, Integer soqlLimit, Schema.SObjectField lookupField) {

    }
    global Selector(Schema.SObjectType type, String soqlWhereClause, String soqlSort, Integer soqlLimit, Schema.SObjectField lookupField, Boolean enableForUpdate) {

    }
    global String buildQueryStatement() {
        return null;
    }
    global String buildQueryStatement(String referenceFieldName) {
        return null;
    }
    global virtual Framework.Selector fields(String fields) {
        return null;
    }
    global virtual List<SObject> getAll() {
        return null;
    }
    global virtual List<Schema.FieldSet> getFieldSets() {
        return null;
    }
    global virtual String getOrderBy() {
        return null;
    }
    global Database.QueryLocator getQueryLocator() {
        return null;
    }
    global Database.QueryLocator getQueryLocator(Set<Id> idSet) {
        return null;
    }
    global Database.QueryLocator getQueryLocator(Set<Id> idSet, String referenceField) {
        return null;
    }
    global virtual Schema.SObjectType getSObjectType() {
        return null;
    }
    global virtual Framework.Selector offset(Integer offset) {
        return null;
    }
    global static Framework.Selector parse(String soql) {
        return null;
    }
    global virtual Framework.Selector relatedFields(String fields) {
        return null;
    }
    global virtual SObject selectById(Id value) {
        return null;
    }
    global virtual SObject selectById(Id value, String referenceFieldName) {
        return null;
    }
    global virtual List<SObject> selectById(Set<Id> idSet) {
        return null;
    }
    global virtual List<SObject> selectById(Set<Id> idSet, String referenceFieldName) {
        return null;
    }
    global List<System.SelectOption> selectOptions() {
        return null;
    }
    global List<System.SelectOption> selectOptions(Set<Id> idSet) {
        return null;
    }
    global List<System.SelectOption> selectOptions(Set<Id> idSet, String referenceFieldName) {
        return null;
    }
}
