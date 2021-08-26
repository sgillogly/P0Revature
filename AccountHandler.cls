public class AccountHandler {
    public static void ModifyDescription(List<Account> newAccounts){
        for(Account currAccount : newAccounts){
            if(currAccount.Description == null){
                currAccount.Description = 'This is a sample description';
            }
            if(currAccount.Account_Type__c == null){
                currAccount.Account_Type__c = 'Business';
            }
            String description = 'Type: ' + currAccount.Account_Type__c + ' Desc: ';
        	description += currAccount.Description;
        	currAccount.Description = description;
        }
        
    }
}