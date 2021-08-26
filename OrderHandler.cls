public class OrderHandler {
    public static void CreateLibraries(List<Order> newOrders){
        List<Library__c> newLibraries = new List<Library__c>();
        for(Order currOrder : newOrders){
            Library__c newLib = new Library__c();
            if(currOrder.AccountId == null){
                currOrder.AccountId = '0015e00000I0En9AAF';
            }
            if(currOrder.Id == null){
                currOrder.Id = '8015e000000OrFnAAK';
            }
        	newLib.Account__c = currOrder.AccountId;
        	newLib.Order__c = currOrder.Id;
            System.debug(currOrder.Id);
            newLibraries.add(newLib);
        }
        Insert newLibraries; 
    }
}