@isTest
public class AccountHandlerTestHelper {
	public static List<Account> CreateAccounts(Integer num){
        List<Account> accountsForTesting = new List<Account>();
        for(Integer i=0; i < num; i++){
            accountsForTesting.add(new Account(name = String.valueOf(i)));
        }
        return accountsForTesting;
    }
    
    public static Integer numValid(List<Account> currAccounts){
        Integer numValid = 0;
        for(Account currAccount : currAccounts){
            if(currAccount.Description.Contains('Type: ') && currAccount.Description.Contains('Desc: ')){
                numValid++;
            }
        }
        return numValid;
    }
}