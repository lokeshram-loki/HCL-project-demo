/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 11-26-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@IsTest
private class SingleEmailMessageExample_Test {
    @TestSetup
    static void data() {
        // Create a Contact with valid email for targetObjectId path
        insert new Contact(LastName = 'Test', Email = 'apex.tester@example.com');
    }

    @IsTest
    static void testSendWithTargetObjectId() {
        Contact c = [SELECT Id FROM Contact LIMIT 1];

        Test.startTest();
        Messaging.SendEmailResult res = SingleEmailMessageExample.sendSingle(
            'Unit Test Subject',
            'Hello from Apex test.',
            null,           // toAddresses
            c.Id,           // targetObjectId
            null,           // whatId
            null,           // orgWideEmailAddressId
            false           // useHtmlBody
        );
        Test.stopTest();

        System.assertNotEquals(null, res, 'Result should not be null');
        System.assertEquals(true, res.isSuccess(), 'Email send should return success (platform may still suppress delivery in test).');
    }

    @IsTest
    static void testSendWithToAddresses() {
        Test.startTest();
        Messaging.SendEmailResult res = SingleEmailMessageExample.sendSingle(
            'Unit Test Subject 2',
            '<b>HTML</b> Body',
            new List<String>{'someone@example.com'}, // toAddresses
            null,           // targetObjectId
            null,           // whatId
            null,           // orgWideEmailAddressId
            true            // useHtmlBody
        );
        Test.stopTest();

        System.assertNotEquals(null, res, 'Result should not be null');
        System.assertEquals(true, res.isSuccess(), 'Email send should return success (delivery is not executed in tests).');
    }

    @IsTest
    static void testDemoToRunningUser() {
        Test.startTest();
        Messaging.SendEmailResult res = SingleEmailMessageExample.demoToRunningUser('Demo Subject', 'Demo Body');
        Test.stopTest();

        System.assertNotEquals(null, res, 'Result should not be null');
        System.assertEquals(true, res.isSuccess(), 'Demo send should succeed.');
    }

    @IsTest
    static void testInputValidation() {
        // Expect an exception when neither targetObjectId nor toAddresses provided
        Boolean thrown = false;
        try {
            Test.startTest();
            SingleEmailMessageExample.sendSingle(
                'Bad',
                'No recipients',
                null,   // toAddresses
                null,   // targetObjectId
                null,   // whatId
                null,   // orgWideEmailAddressId
                false
            );
            Test.stopTest();
        } catch (Exception e) {
            thrown = true;
            System.assert(e.getMessage().contains('Provide either targetObjectId'), 'Should indicate missing recipient info.');
        }
        System.assertEquals(true, thrown, 'Should have thrown due to missing recipients.');
    }
}
