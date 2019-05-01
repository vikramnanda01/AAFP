<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Proforma_Invoice_Email</fullName>
        <description>Proforma Invoice Email</description>
        <protected>false</protected>
        <recipients>
            <field>Preferred_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>FON_Proforma_Email_Templates/FON_Proforma_Invoice_Email_Template</template>
    </alerts>
    <fieldUpdates>
        <fullName>Email_Sent</fullName>
        <field>Proforma_Invoice_Email_Sent__c</field>
        <literalValue>1</literalValue>
        <name>Email Sent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Email_Sent_Date</fullName>
        <field>Proforma_Invoice_Email_Sent_Date__c</field>
        <formula>TODAY()</formula>
        <name>Email Sent Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Proforma_Field_Update</fullName>
        <field>Auto_Send_Proforma_Invoice_Emails__c</field>
        <literalValue>0</literalValue>
        <name>Proforma Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Proforma Invoice Email</fullName>
        <actions>
            <name>Proforma_Invoice_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Email_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Email_Sent_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Proforma_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( Auto_Send_Proforma_Invoice_Emails__c, NOT( ISNULL( Preferred_Email__c ) ) , ISPICKVAL( Posting_Entity__c , &apos;Receipt&apos;),  Is_Closed__c , NOT( Is_Posted__c ), NOT( Is_Cancelled__c ),             NOT( ISBLANK( Preferred_Email__c ) )  )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
