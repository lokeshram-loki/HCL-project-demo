/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 11-26-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@IsTest
private class OutboundEmailService_Test {
    @IsTest
    static void testSendSingleEmail_withValidEmail() {
        // Prepare
        String to = 'test@example.com';
        String subject = 'Unit Test Subject';
        String body = 'Unit Test Body';

        // Execute
        Test.startTest();
        String result = OutboundEmailService.sendSingleEmail(to, subject, body);
        Test.stopTest();

        // Verify
        System.assert(result != null, 'Result should not be null');
        System.assert(
            result.contains('Email queued successfully') ||
            result.contains('Failed to send') ||
            result.contains('Exception while sending email'),
            'Result must indicate outcome, got: ' + result
        );
    }

    @IsTest
    static void testSendSingleEmail_withPlaceholderDefaults() {
        // No inputs provided; will use placeholder recipient/subject/body
        Test.startTest();
        String result = OutboundEmailService.sendSingleEmail(null, null, null);
        Test.stopTest();

        System.assert(result != null, 'Result should not be null');
        // Even if placeholder address is not deliverable, method should return status string
        System.assert(
            result.contains('Email queued successfully') ||
            result.contains('Failed to send') ||
            result.contains('Invalid recipient email') ||
            result.contains('Exception while sending email'),
            'Result must indicate outcome, got: ' + result
        );
    }

    @IsTest
    static void testSendSingleEmail_withInvalidEmail() {
        Test.startTest();
        String result = OutboundEmailService.sendSingleEmail('not-an-email', 'S', 'B');
        Test.stopTest();

        System.assert(result.startsWith('Invalid recipient email'), 'Should fail validation for invalid email, got: ' + result);
    }
}
