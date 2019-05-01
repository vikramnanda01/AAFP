<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Event_Registration_Agenda_Email</fullName>
        <description>Event Registration Agenda Email</description>
        <protected>true</protected>
        <recipients>
            <field>EventApi__Preferred_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>FON_Event_Email_Templates/FON_Event_Registration_Email_Template</template>
    </alerts>
    <fieldUpdates>
        <fullName>Toggle_Notification_Checkbox</fullName>
        <field>EventApi__Send_Notification__c</field>
        <literalValue>0</literalValue>
        <name>Toggle Notification Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>true</protected>
    </fieldUpdates>
    <rules>
        <fullName>Agenda Registration Email</fullName>
        <actions>
            <name>Event_Registration_Agenda_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Toggle_Notification_Checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>EventApi__Attendee__c.EventApi__Preferred_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>EventApi__Attendee__c.EventApi__Registration_Site_Url__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>EventApi__Attendee__c.EventApi__Send_Notification__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
