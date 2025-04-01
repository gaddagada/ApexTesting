@IsTest 
private class AccountWrapperTests {
    @TestSetup 
    static void loadTestData(){
        // GIVEN 
        Account acct = new Account(Name = 'ACME');
        insert acct; 
        List<Opportunity> opps = TestFactory.generateOppsForAccount(acct.id, 1000.00, 5);
        insert opps; 
    }
    @IsTest 
    static void testPositiveRoundedAveragePrice() {
        // WHEN 
        Account acct = [SELECT Id FROM Account LIMIT 1];
        AccountWrapper acctWrapper = new AccountWrapper(acct);
        //THEN 
        Test.startTest();
            Assert.areEqual(1000.00, acctWrapper.getRoundedAvgPriceOfOpps(), 'Expected to get 1000.00');
        Test.stopTest();
    }
    @IsTest 
    static void testIsHighPriority(){
        // WHEN 
        List<AccountWrapper> accounts = new List<AccountWrapper>();
        for(Account a : [SELECT ID, Name FROM ACCOUNT]){
            accounts.add(new AccountWrapper(a));
        }
        // Sanity check asserting that we have opportunities before executing our tested method 
        // Also get the amount field so we can update 
        List<Opportunity> sanityCheckListOfOpps = [SELECT Id, Amount FROM Opportunity];
        System.assert(sanityCheckListOfOpps.size() > 0, 'You need an opportunity to continue');
            for(Opportunity opp : sanityCheckListOfOpps){
                opp.Amount = 100000;
            }

        // Update the list of opportunities with the new values 
        update sanityCheckListOfOpps; 

        // THEN 
        Test.startTest();
        for(AccountWrapper a : accounts) {
            System.assertEquals(a.isHighPriority(), false, 'Expected isHighPriority return false');
        }
        Test.stopTest();
    }
    @IsTest 
    static void testNegativeAccountWrapperAvgPriceOfOpps(){
        // GIVEN 
        Account acct = [SELECT ID FROM Account LIMIT 1]; 
        List<Opportunity> opps = [
            SELECT Amount
            FROM Opportunity
            WHERE accountId = :acct.Id
        ];
        for(Opportunity o : opps){
            o.Amount = 0; 
        }
        update opps; 
        AccountWrapper acctWrapper = new AccountWrapper(acct);
        // WHEN 
        try{
            Test.startTest(); 
                acctWrapper.getRoundedAvgPriceOfOpps();
            Test.stopTest();
            Assert.fail('An exception should have been thrown');
        }catch(AccountWrapper.AWException e){
                // THEN
                Assert.isTrue(
                e.getMessage().equalsIgnoreCase('no won opportunities'),
                'Exception message does not match: ' + e.getMessage()
            );
        }
    }

}