trigger DriverTrigger on Driver__c (before insert,after insert) {
	switch on trigger.operationType {
        when BEFORE_INSERT{
            DriverHandler.ValidateDriverNames(trigger.new);
        }
    	when AFTER_INSERT { 
            DriverHandler.ValidateDrivers(trigger.new);
    	}
    }  
}
