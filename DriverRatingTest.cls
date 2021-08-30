@isTest
public class DriverRatingTest {
    
	@testSetup
   	public static void SetupTests() {
        
      /*List<Driver__c> toInsert = TestHelper.CreateDrivers(151,500,80,130,10);
      Insert toInsert;
      */
      TestHelper.InsertDrivers(151,500,80,130,10);  
    }
    
    @isTest 
    public static void TP_IsSatisfactory()
    {
        Test.startTest();
        List<Driver__c> DL = [SELECT Rating__c,CompletionRate__c,Status__c From Driver__c LIMIT 1];
        Formula.recalculateFormulas(DL);
        Boolean result = DriverHandler.IsSatisfactory(DL[0]);
        System.assertEquals(True, result);
        
        Test.stopTest();
    }
    
    @isTest
    public static void TN_IsSatisfactory()
    {
        Test.startTest();
        List<Driver__c> DL = TestHelper.CreateDrivers(1,400,150,100,10);
        Formula.recalculateFormulas(DL);
        Boolean result = DriverHandler.IsSatisfactory(DL[0]);
        System.assertEquals(False, result);
        
        DL[0].DeliveriesCanceled__c -= 25;
        DL[0].DisLike_Vote__c += 25;
        Formula.recalculateFormulas(DL);
        result = DriverHandler.IsSatisfactory(DL[0]);
        System.assertEquals(False, result);
        
        Test.stopTest();
	}
    
    @isTest
    public static void TP_ValidateDrivers(){
        
        Test.startTest();
        List<Driver__c> DL = [SELECT Rating__c,CompletionRate__c,Status__c From Driver__c LIMIT 5];
        Formula.recalculateFormulas(DL);
        DriverHandler.ValidateDrivers(DL);
        Integer numValid = 0;
        for(Driver__c currDriver : DL) {
            if (currDriver.Status__c=='disabled') {
                numValid++;
            }
        }
        System.assertEquals(0, numValid);
        Test.stopTest();
    }
    
    @isTest
    public static void TN_ValidateDrivers(){
        
        Test.startTest();
        List<Driver__c> DL = TestHelper.CreateDrivers(5,300,101,100,10);
        Formula.recalculateFormulas(DL);
        DriverHandler.ValidateDrivers(DL);
        Integer numValid = 0;
        for(Driver__c currDriver : DL) {
            if (currDriver.Status__c == 'disabled') {
                numValid++;
            }
        }
        System.assertEquals(5, numValid);
        Test.stopTest();
    }
    
    @isTest
    public static void TS_ValidateDrivers(){
        
        Test.startTest();
        List<Driver__c> DL = [SELECT Rating__c,CompletionRate__c,Status__c From Driver__c LIMIT 1];
        Formula.recalculateFormulas(DL);
        DriverHandler.ValidateDrivers(DL);
        Integer numValid = 0;
        for(Driver__c currDriver : DL) {
            if (currDriver.Status__c == 'disabled') {
                numValid++;
            }
        }
        System.assertEquals(0, numValid);
        Test.stopTest();
    }
    
    @isTest
    public static void TB_ValidateDrivers(){
        
        Test.startTest();
        List<Driver__c> DL = [SELECT Rating__c,CompletionRate__c,Status__c From Driver__c LIMIT 151];
        Formula.recalculateFormulas(DL);
        DriverHandler.ValidateDrivers(DL);
        Integer numValid = 0;
        for(Driver__c currDriver : DL) {
            if (currDriver.Status__c=='disabled') {
                numValid++;
            }
        }
        System.assertEquals(0,numValid);
        Test.stopTest();
    }
}