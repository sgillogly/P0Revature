@isTest 
public class DeliveryHandlerTest {
	
    @testSetup
    public static void SetupTests() {
      	List<Delivery__c> toInsert = TestHelper.CreateDeliveries(151,3, 5, 1, 20,'assigning');
      	Insert toInsert;
    }
    
    @isTest
    public static void TP_AdjustPromotions() {
        
        Test.startTest();
        
        Delivery__c D = TestHelper.createDelivery(5,5,9,10,'assigning');
        List<Delivery__c> DL = new List<Delivery__c>{D};
        DeliveryHandler.AdjustPromotions(DL[0]);
        Boolean result = DeliveryHandler.greaterPromotions(DL[0]);
        System.assertEquals(False, result);  
        
        DL[0].Tips__c=0;
        DeliveryHandler.AdjustPromotions(DL[0]);
        result = DeliveryHandler.greaterPromotions(DL[0]);
        System.assertEquals(True, result); 
        Test.stopTest();      
    }
    
    @isTest
    public static void TP_Minimalpay(){
        
        Test.startTest();
        List<Delivery__c> DL = [SELECT Promotions__c From Delivery__c LIMIT 151];
        
        DeliveryHandler.MinimalPay(DL);
        Integer numValid = 0;
        for(Delivery__c currDelivery : DL) {
            if (currDelivery.Promotions__c > 0) {
                numValid++;
            }
        }
        System.assertEquals(151, numValid);
        Test.stopTest();
    }
    
    @isTest
    public static void TN_Minimalpay(){
        
        Test.startTest();
		List<Delivery__c> D = TestHelper.CreateDeliveries(1,5,5,0,10,'assigning');
        DeliveryHandler.MinimalPay(D);
        Boolean result = D[0].Promotions__c > 0;
        System.assertEquals(true, result);
        Test.stopTest();
    }
        
}
