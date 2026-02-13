/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 11-26-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class SingleEmailMessageExample {
    /**
     * Sends a single email using Messaging.SingleEmailMessage.
     * Preferred usage: pass targetContactId (or Lead/User) OR explicit toAddresses.
     * If targetObjectId is provided, Salesforce uses the standard email template footer/opt-out and sets the to address from the record.
     *
     * @param subject       Email subject
     * @param plainTextBody Plain text body (use htmlBody for rich content)
     * @param toAddresses   Optional list of explicit email addresses (used when targetObjectId is null)
     * @param targetObjectId Optional Id of Contact, Lead, or User for recipient (recommended)
     * @param whatId        Optional related record Id to merge fields from (e.g., Case, Opportunity)
     * @param orgWideEmailAddressId Optional Org-Wide Email Address Id to send from
     * @param useHtmlBody   If true, treats plainTextBody parameter as HTML body
     * @return Messaging.SendEmailResult for inspection by callers
     */
    @AuraEnabled
    public static Messaging.SendEmailResult sendSingle(
        String subject,
        String plainTextBody,
        List<String> toAddresses,
        Id targetObjectId,
        Id whatId,
        Id orgWideEmailAddressId,
        Boolean useHtmlBody
    ) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

        // Subject
        mail.setSubject(subject);

        // Body
        if (useHtmlBody == true) {
            mail.setHtmlBody(plainTextBody);
        } else {
            mail.setPlainTextBody(plainTextBody);
        }

        // Recipient handling
        if (targetObjectId != null) {
            mail.setTargetObjectId(targetObjectId);
            // When using setTargetObjectId, you must also setSaveAsActivity if you want activity created
            mail.setSaveAsActivity(true);
        } else if (toAddresses != null && !toAddresses.isEmpty()) {
            mail.setToAddresses(toAddresses);
            mail.setSaveAsActivity(true);
        } else {
            throw new AuraHandledException('Provide either targetObjectId or at least one toAddress.');
        }

        // Related record
        if (whatId != null) {
            mail.setWhatId(whatId);
        }

        // From address via Org-Wide Email Address
        if (orgWideEmailAddressId != null) {
            mail.setOrgWideEmailAddressId(orgWideEmailAddressId);
        }

        // Opt-out compliance when using targetObjectId is handled automatically.
        // If using setToAddresses only, ensure you comply with email preferences and consent.

        // Send
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.Email[] { mail }, false);
        return (results != null && results.size() > 0) ? results[0] : null;
    }

    /**
     * Convenience demo method: emails the running user (safe for many sandboxes).
     * Uses UserInfo.getUserId() as targetObjectId to avoid hard-coding addresses.
     */
    @AuraEnabled
    public static Messaging.SendEmailResult demoToRunningUser(String subject, String bodyText) {
        return sendSingle(subject, bodyText, null, UserInfo.getUserId(), null, null, false);
    }
}
