@isTest
public class OrderHandlerTestHelper {
	public static List<Order> CreateOrders(Integer num){
        List<Order> ordersForTesting = new List<Order>();
        for(Integer i=0; i < num; i++){
            ordersForTesting.add(new Order(AccountId = '0015e00000I0En9AAF', EffectiveDate = Date.today(), Status = 'Draft'));
        }
        return ordersForTesting;
    }
    
    public static List<Library__c> CreateTestLibraries(Integer num){
        List<Library__c> librariesForTesting = new List<Library__c>();
        for(Integer i=0; i < num; i++){
            librariesForTesting.add(new Library__c(Account__c = '0015e00000I0GkPAAV', Order__c = '8015e000000OrFnAAK'));
        }
        return librariesForTesting;
    }
    
    public static Integer numValid(List<Order> currOrders, List<Library__c> currLibs){
        Integer num = 0;
        //check if currOrder.AccountId == currLib.Account__c if true numValid++
        for(Integer i = 0; i < currOrders.Size(); i++){
            if(currOrders[i].AccountId == currLibs[i].Account__c){
                num++;
            }
        }
        return num;
    }
}