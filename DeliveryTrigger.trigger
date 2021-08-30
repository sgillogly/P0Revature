trigger DeliveryTrigger on Delivery__c (after update) {
    switch on trigger.operationType {

        when AFTER_UPDATE { 

            DeliveryHandler.MinimalPay(trigger.old);
        }

    }
}