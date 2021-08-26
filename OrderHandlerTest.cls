@isTest
public class OrderHandlerTest {
	@testSetup
    public static void testSetup(){
        List<Order> testOrders = OrderHandlerTestHelper.CreateOrders(151);
        //insert records to be accessible to other test methods
        Insert testOrders;
    }
    
    @isTest
   	public static void TP_CreateLibraries(){
        
        Test.startTest();
        
        List<Order> testOrders = [SELECT Order.Id, Account.Id FROM Order LIMIT 10];
        OrderHandler.CreateLibraries(testOrders);
        List<Library__c> testLibs = [SELECT Order__c, Account__c FROM Library__C LIMIT 10];
        System.assertEquals(10, OrderHandlerTestHelper.numValid(testOrders, testLibs));
        
        Test.stopTest();
    }
    
    @isTest
   	public static void TN_CreateLibraries(){
        Test.startTest();
        
        List<Order> testOrders = OrderHandlerTestHelper.CreateOrders(10);
        OrderHandler.CreateLibraries(testOrders);
        List<Library__c> testLibs = OrderHandlerTestHelper.CreateTestLibraries(10);
        System.assertEquals(0, OrderHandlerTestHelper.numValid(testOrders, testLibs));
        
        Test.stopTest();
    }
    
    @isTest
   	public static void TS_CreateLibraries(){
        
        Test.startTest();
        
        List<Order> testOrders = [SELECT Order.Id, Account.Id FROM Order LIMIT 1];
        OrderHandler.CreateLibraries(testOrders);
        List<Library__c> testLibs = [SELECT Order__c, Account__c FROM Library__C LIMIT 1];
        System.assertEquals(1, OrderHandlerTestHelper.numValid(testOrders, testLibs));
        
        Test.stopTest();
    }
    
    @isTest
   	public static void TB_CreateLibraries(){
        
        Test.startTest();
        
        List<Order> testOrders = [SELECT Order.Id, Account.Id FROM Order LIMIT 151];
        OrderHandler.CreateLibraries(testOrders);
        List<Library__c> testLibs = [SELECT Order__c, Account__c FROM Library__C LIMIT 151];
        System.assertEquals(151, OrderHandlerTestHelper.numValid(testOrders, testLibs));
        
        Test.stopTest();
    }
}