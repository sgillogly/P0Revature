public class DeliveryHandler {
		//public double Minimal = 9;
    	
    	public static void MinimalPay(List<Delivery__c> DeliveryList) 
        {
            for(Delivery__c currDelivery : DeliveryList) {
                if(currDelivery.Status__c != 'assigning') {
                    continue;
                }
                else {
                    AdjustPromotions(currDelivery);
                }
       		}
        }   
         

        public static void AdjustPromotions(Delivery__c D) 
        {
            double estPromotions = 9 - D.DriverExpectedEarning__c;
            //double estPromotions = minimalPay - D.DriverExpectedEarning__c;
            D.Promotions__c = estPromotions > 0 ? estPromotions : 0 ; 
        }
        
}