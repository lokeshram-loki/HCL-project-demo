/**
 * @description       : Utility to send a single outbound email via SingleEmailMessage
 * @author            : Agentforce
 * @group             : 
 * @last modified on  : 11-26-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class OutboundEmailService {
    /**
     * Sends a single outbound email using SingleEmailMessage.
     * Defaults (placeholders) are used when inputs are null/empty.
     * - Sender: current user context
     * - Recipient: placeholder@example.com (if none provided)
     * - Subject: "Hello from Apex"
     * - Body: "Single message from Apex via SingleEmailMessage"
     */
    @AuraEnabled
    public static String sendSingleEmail(String recipientEmail, String subject, String body) {
        // Fallbacks
        String toAddress = String.isBlank(recipientEmail) ? 'placeholder@example.com' : recipientEmail.trim();
        String emailSubject = String.isBlank(subject) ? 'Hello from Apex' : subject;
        String emailBody = String.isBlank(body) ? 'Single message from Apex via SingleEmailMessage' : body;

        // Basic validation
        if (!isLikelyEmail(toAddress)) {
            return 'Invalid recipient email: ' + toAddress;
        }

        try {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new String[] { toAddress });
            mail.setSubject(emailSubject);
            mail.setPlainTextBody(emailBody);
            // Optionally set user as sender implicitly; avoid setOrgWideEmailAddressId unless using OWEA
            // mail.setSaveAsActivity(true); // enable if you want activity logged

            Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail }, false);
            if (results != null && results.size() > 0) {
                Messaging.SendEmailResult res = results[0];
                if (res.isSuccess()) {
                    return 'Email queued successfully to ' + toAddress;
                } else if (res.getErrors() != null && res.getErrors().size() > 0) {
                    return 'Failed to send: ' + res.getErrors()[0].getMessage();
                } else {
                    return 'Failed to send: Unknown error';
                }
            }
            return 'Unknown send status.';
        } catch (Exception e) {
            return 'Exception while sending email: ' + e.getMessage();
        }
    }

    // Lightweight email format guard to avoid obvious mistakes
    private static Boolean isLikelyEmail(String addr) {
        if (String.isBlank(addr)) return false;
        // very simple heuristic; server-side Messaging API will still enforce rules
        return Pattern.matches('^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$', addr);
    }
}
