<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Event_Accept_Invitation_Email</fullName>
        <description>Event Accept Invitation Email</description>
        <protected>true</protected>
        <recipients>
            <field>Preferred_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>FON_Event_Email_Templates/FON_Event_Accept_Invitation_Template</template>
    </alerts>
    <alerts>
        <fullName>Event_Decline_Invitation_Email</fullName>
        <description>Event Decline Invitation Email</description>
        <protected>true</protected>
        <recipients>
            <field>Preferred_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>FON_Event_Email_Templates/FON_Event_Accept_Invitation_Template</template>
    </alerts>
    <alerts>
        <fullName>Event_Registration_Email</fullName>
        <description>Event Registration Email</description>
        <protected>true</protected>
        <recipients>
            <field>Preferred_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>FON_Event_Email_Templates/FON_Event_Registration_Email_Template</template>
    </alerts>
    <fieldUpdates>
        <fullName>Invitation_Sent_Picklist_Update</fullName>
        <field>Invitation_Status__c</field>
        <literalValue>Sent</literalValue>
        <name>Invitation Sent Picklist Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Invitation_Status_Set_Accepted</fullName>
        <field>Invitation_Status__c</field>
        <literalValue>Accepted</literalValue>
        <name>Invitation Status Set Accepted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>true</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Invitation_Status_Set_Declined</fullName>
        <field>Invitation_Status__c</field>
        <literalValue>Declined</literalValue>
        <name>Invitation Status Set Declined</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_Send_Notification_On_Accept</fullName>
        <field>Send_Notification__c</field>
        <literalValue>0</literalValue>
        <name>Reset Send Notification On Accept</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>true</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_Send_Notification_On_Decline</fullName>
        <field>Send_Notification__c</field>
        <literalValue>0</literalValue>
        <name>Reset Send Notification On Decline</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Toggle_Invitation_Checkbox</fullName>
        <description>Toggle Invitation Checkbox</description>
        <field>Send_Invitation_Email__c</field>
        <literalValue>0</literalValue>
        <name>Toggle Invitation Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Toggle_Notification_Checkbox</fullName>
        <field>Send_Notification__c</field>
        <literalValue>0</literalValue>
        <name>Toggle Notification Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Send_Date</fullName>
        <field>Last_Invitation_Email_Sent__c</field>
        <formula>Now()</formula>
        <name>Update Send Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Event Invitation Accepted Email</fullName>
        <actions>
            <name>Event_Accept_Invitation_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Invitation_Status_Set_Accepted</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Reset_Send_Notification_On_Accept</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3</booleanFilter>
        <criteriaItems>
            <field>Attendee__c.Preferred_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Attendee__c.Send_Notification__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Attendee__c.Invitation_Status__c</field>
            <operation>equals</operation>
            <value>Accepted</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Event Invitation Declined Email</fullName>
        <actions>
            <name>Event_Decline_Invitation_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Invitation_Status_Set_Declined</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Reset_Send_Notification_On_Decline</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Attendee__c.Preferred_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Attendee__c.Is_Invitation_Declined__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Attendee__c.Send_Notification__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Event Registration Email</fullName>
        <actions>
            <name>Event_Registration_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Toggle_Notification_Checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3</booleanFilter>
        <criteriaItems>
            <field>Attendee__c.Preferred_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Attendee__c.Send_Notification__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Event__c.Invitation_Only__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Invitation Event Registration Email</fullName>
        <actions>
            <name>Event_Registration_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Invitation_Sent_Picklist_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Toggle_Invitation_Checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Toggle_Notification_Checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Send_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3) AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>Attendee__c.Preferred_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Attendee__c.Send_Notification__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Attendee__c.Send_Invitation_Email__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Attendee__c.Is_Invitation_Not_Sent__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Event__c.Invitation_Only__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Attendee__c.Is_Invitation_Accepted__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Attendee__c.Is_Invitation_Declined__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Non Invitation Event Registration Email</fullName>
        <actions>
            <name>Event_Registration_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Toggle_Notification_Checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Attendee__c.Preferred_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Attendee__c.Send_Notification__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Event__c.Invitation_Only__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
