public class DriverHandler {

		//public Double minimalRating = 0.8;
    
    	public static void ValidateDrivers(List<Driver__c> driverList)
    	{
        	for(Driver__c driver : driverList) {
                if(IsSatisfactory(driver)){
                    continue;
                }
                else {
                    DisableDriver(Driver);
                }
       		}
        }
        
        public static Boolean IsSatisfactory(Driver__c driver)
        {
            //return driver.Rating__c >= minimalRating && driver.CompletionRate__c >= minimalRating ;
            return (driver.Rating__c >= 0.8 && driver.CompletionRate__c >= 0.8) ;
        }

        public static void DisableDriver(Driver__c driver)
        {
           
            if(driver.Status__c == 'active' || driver.Status__c == 'offline')
            {
                driver.Status__c = 'disabled';
            }
        }
    	
    	public static void ValidateDriverNames(List<Driver__c> Drivers)
        {
          	for(Driver__c currDriver :Drivers ) {
            	if(IsValidName(currDriver))
                {
                   continue; 
                }
                else
                {
                    currDriver.Name='Your Driver';
                }
        	}
        }

        public static Boolean IsValidName(Driver__c Driver)
        {
            Return Driver.Name != NUll;
        }
}