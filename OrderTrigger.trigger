trigger OrderTrigger on Order (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    switch on trigger.operationType{
        when BEFORE_INSERT{
            
        }
        when BEFORE_UPDATE{
            
        }
        when BEFORE_DELETE{
            
        }
        when AFTER_INSERT{
            OrderHandler.CreateLibraries(trigger.new);
        }
        when AFTER_UPDATE{
            
        }
        WHEN AFTER_DELETE{
            
        }
        WHEN AFTER_UNDELETE{
            
        }
    }
}