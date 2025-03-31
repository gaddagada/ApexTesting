public class AccountProcessor {
	@future 
    public static void countContacts(List<Id> accountIds){
        List<Account> accounts = [SELECT Id, Name FROM account WHERE Id IN :accountIds];
        List<Account> updatedAccounts = new List<Account>(); 
        for(Account account : accounts){
            account.Number_Of_Contacts__c = [SELECT count() FROM Contact WHERE AccountId = :account.Id];
            System.debug('No of Contacts = ' + account.Number_Of_Contacts__c);
            updatedAccounts.add(account);
        }
        update updatedAccounts;
        
    }
}