@IsTest 
private class DataGenerationTests{
    @IsTest 
    static void testBruteForceAccountCreation(){
        //GIVEN 
        List<Account> accts; 
        Account a = new Account(name='McTesterson LLC'); 
        insert a;
        // WHEN 
        Test.startTest(); 
        accts = [SELECT Id FROM Account];
        Test.stopTest(); 
        //THEN 
        Assert.isTrue(accts.size() > 0, 'Was expecting to find at least one account');
    }
    
    @IsTest
    static void testUseTestFactoryToCreateAccountsWithContacts() {
         // GIVEN
        List<Account> accts;
        List<Contact> contacts;
        TestFactory.generateAccountWithContacts(5);
         // WHEN
        Test.startTest();
            accts = [SELECT Id FROM Account];
            contacts = [SELECT Id FROM Contact];
        Test.stopTest();
         // THEN
        Assert.isTrue(accts.size() > 0, 'Was expecting to find at least one account');
        Assert.areEqual(6, contacts.size(), 'Was expecting to find 6 contacts');
    }

    @IsTest
    static void testAtTestSetupMethodsRule() {
        // WHEN
        List<Opportunity> opps = [SELECT Id, AccountId FROM Opportunity];
        // THEN
        Assert.areEqual(1, opps.size(), 'Expected test to find a single Opp');
    }
}
