@isTest
public class NameHandlerTest {
	
    @testSetup
    public static void SetupTests() {
		List<Account> testAccounts = new List<Account>();
        for(Integer num = 0; num < 151; num++) {
            testAccounts.add(new Account(name = 'Test Account ' + num));
        }
        Insert testAccounts;
    }
    @isTest
    public static void TP_checkName(){
        Test.startTest();
        List<Account> testAccounts = [SELECT Name FROM Account LIMIT 10];
        NameHandler.checkName(testAccounts);
        Test.stopTest();
    }
    
	@isTest
    public static void TRU_checkName(){
        User admin = [SELECT name FROM User WHERE Profile.name = 'System Administrator' LIMIT 1];

        Test.startTest();
        System.runAs(admin) {
        	List<Account> testAccounts = [SELECT Name FROM Account LIMIT 1];
        	NameHandler.checkName(testAccounts);
        Test.stopTest();
    	}
    }
}