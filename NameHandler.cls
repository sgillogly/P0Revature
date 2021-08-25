public class NameHandler {
    public static void checkName(List<Account> newAccounts){

		Set<String> nameSet = new Set<String>();

		for(Account acc : newAccounts){
			nameSet.add(acc.name);
			}
	List<Account> accList = new List<Account>([select id,name from Account where name in: nameSet]);

	for(Account a : newAccounts){

		if(accList.size() > 0 )
		a.addError('Account already exists in this database with the name '+a.name);

	}
}
}