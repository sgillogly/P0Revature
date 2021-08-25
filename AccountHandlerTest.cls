@isTest
public class AccountHandlerTest {
    @testSetup
    public static void SetupTests(){
        List<Account> testAccounts = AccountHandlerTestHelper.CreateAccounts(151);
        //insert records to be accessible to other test methods
        Insert testAccounts;
    }
    
    @isTest
    public static void TP_ModifyDescription(){
        
        Test.startTest();
        
        List<Account> testAccounts = [SELECT Description, Account_Type__c FROM Account LIMIT 10];
        AccountHandler.ModifyDescription(testAccounts);
        
        System.assertEquals(10, AccountHandlerTestHelper.numValid(testAccounts));
        
        Test.stopTest();
    }
    
    @isTest
    public static void TN_ModifyDescription(){

        Test.startTest();
        
        List<Account> testAccounts = AccountHandlerTestHelper.CreateAccounts(15);
        AccountHandler.ModifyDescription(testAccounts);
        
        System.assertEquals(15, AccountHandlerTestHelper.numValid(testAccounts));
        
        Test.stopTest();
    }
    
    @isTest
    public static void TS_ModifyDescription(){
        
        Test.startTest();
        
        List<Account> testAccounts = [SELECT Description, Account_Type__c FROM Account LIMIT 1];
        AccountHandler.ModifyDescription(testAccounts);
        
        System.assertEquals(1, AccountHandlerTestHelper.numValid(testAccounts));
        
        Test.stopTest();
    }
    
    @isTest
    public static void TB_ModifyDescription(){
        
        Test.startTest();
        
        List<Account> testAccounts = [SELECT Description, Account_Type__c FROM Account LIMIT 151];
        AccountHandler.ModifyDescription(testAccounts);
        
        System.assertEquals(151, AccountHandlerTestHelper.numValid(testAccounts));
        
        Test.stopTest();
    }
}