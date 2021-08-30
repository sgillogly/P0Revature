@isTest
public class DriverNameTest {

    @testSetup
    public static void SetupTests() {
      	
       	/*List<Driver__c> driversToInsert = new List<Driver__c>();
        	for(Integer num = 0; num < 151; num++) {
        	driversToInsert.add(new Driver__c(name = 'D' + num,Status__c='Active'));
        }
        
        Insert driversToInsert;*/
        TestHelper.InsertDrivers(151);
    }
    
    @isTest
    public static void TP_IsValidName() {
        
        Test.startTest();
        
        Driver__c testDriver = [SELECT Name From Driver__c LIMIT 1];
        Boolean result = DriverHandler.IsValidName(testDriver);
        System.assertEquals(true, result);
        
        testDriver.name = 'Jenny';
        result = DriverHandler.IsValidName(testDriver);
        System.assertEquals(true, result);
        
        testDriver.name = Null;
        result = DriverHandler.IsValidName(testDriver);
        System.assertEquals(false, result);
        
        Test.stopTest();
    }
    
	@isTest
    public static void TP_ValidateAccounts() {
        Test.startTest();
        
        // Testing with good data means we should get a good output
        List<Driver__c> DriversList = [SELECT Name From Driver__c LIMIT 15];
        DriverHandler.ValidateDriverNames(DriversList);
        
        Integer numValid = 0;
        for(Driver__c currDriver : DriversList) {
            if (currDriver.name.Contains('D')) {
                numValid++;
            }
        }
        System.assertEquals(15, numValid);
        
        Test.stopTest();
    }
    
    @isTest
    public static void TN_ValidateAccounts() {
        Test.startTest();
        
        // Testing with good data means we should get a good output
        List<Driver__c> D = new List<Driver__c>{new Driver__c(name=NULL,Status__c='active')};
        DriverHandler.ValidateDriverNames(D);
        
        Boolean result = D[0].name == 'Your Driver';
        System.assertEquals(true, result);
        
        Test.stopTest();
    }
    
}