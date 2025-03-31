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

}