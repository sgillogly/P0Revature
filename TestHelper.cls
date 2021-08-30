@isTest
public class TestHelper {
	public static void InsertDrivers(Integer numDrivers) {
        
        List<Driver__c> toInsert = CreateDrivers(numDrivers);     
        Insert toInsert;
        
    }
    
    // This also enables us to create data without having to insert it
    public static List<Driver__c> CreateDrivers(Integer numDrivers) {
        
        List<Driver__c> toReturn = new List<Driver__c>();
        for(Integer num = 0; num < numDrivers; num++) {
            toReturn.add(new Driver__c(name = 'D' + num,Status__c='active'));
        }
        return toReturn;
    
    }
    
    public static void InsertDrivers(Integer numDrivers,Integer numDeliveryCompleted, Integer numDeliveryCanceled,Integer numLikeVote, Integer numDislikeVote) {
        
        List<Driver__c> toInsert = CreateDrivers(numDrivers, numDeliveryCompleted, numDeliveryCanceled, numLikeVote, numDislikeVote);     
        Insert toInsert;
        
    }
    
    public static List<Driver__c> CreateDrivers(Integer numDrivers,Integer numDeliveryCompleted, Integer numDeliveryCanceled,Integer numLikeVote, Integer numDislikeVote) {
        
        List<Driver__c> toReturn = new List<Driver__c>();
        for(Integer num = 0; num < numDrivers; num++) {
            toReturn.add(CreateDriver(numDeliveryCompleted, numDeliveryCanceled,numLikeVote, numDislikeVote));
            toReturn[num].name += num;
            numDeliveryCompleted += 10;
            numDeliveryCanceled += 1;
            numLikeVote += 30;
            numDislikeVote += 1;
            
        }
        return toReturn;
    }
    
   	public static Driver__c CreateDriver(Integer numDeliveryCompleted, Integer numDeliveryCanceled,Integer numLikeVote, Integer numDislikeVote)
    {
        return new Driver__c(name='D',DeliveriesCompleted__c=numDeliveryCompleted,DeliveriesCanceled__c=numDeliveryCanceled,Like_Vote__c=numLikeVote,DisLike_Vote__c=numDislikeVote, Status__c='Active');
    }
    
    public static List<Delivery__c> createDeliveries(Integer numDeliveries,Decimal DTS, Decimal DTH, Decimal Tips, Decimal PT,String Status) {
        
        List<Delivery__c> toReturn = new List<Delivery__c>();
        for(Integer num = 0; num < numDeliveries; num++) {
            toReturn.add(createDelivery(DTS,DTH,TipS,PT,Status));
            toReturn[num].Name += num;
            DTS += Math.sin(num);
            DTH += Math.cos(num);
            Tips += Math.log(num+2)/Math.pow(Double.valueOf(num+1),2);
            PT += Math.sin(num);
        }
        return toReturn;
    }
    
    /*public static Delivery__c randomDelivery()
    {
        Delivery__c D=new Delivery__c();
        D.DistanceToStore__c  = Double.valueof(Math.random() * 15.0);
		D.DistanceToStore__c =  D.DistanceToStore__c.setScale(2, RoundingMode.HALF_UP);
        D.DistanceToHome__c = Double.valueof(Math.random() * 5.0);
		D.DistanceToHome__c =  D.DistanceToHome__c.setScale(2, RoundingMode.HALF_UP);
        D.Tips__c = Double.valueof(Math.random() * 10.0);
		D.Tips__c = D.Tips__c.setScale(2, RoundingMode.HALF_UP);
        D.PreparationTime__c = Double.valueof(Math.random() * 25.0);
		D.PreparationTime__c = D.PreparationTime__c.setScale(0, RoundingMode.HALF_UP);
        D.Status__c = 'preparing';
        return D;
    }*/
    
    public static Delivery__c createDelivery(Decimal DTS, Decimal DTH, Decimal Tips, Decimal PT,String Status) {
        return new Delivery__c(Name='D',DistanceToStore__c=DTS,DistanceToHome__c=DTH,Tips__c=Tips,PreparationTime__c=PT,Status__c=Status);
    }
    
}