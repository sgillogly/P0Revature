trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    switch on trigger.operationType{
        when BEFORE_INSERT{
            AccountHandler.ModifyDescription(trigger.new);
        }
        when BEFORE_UPDATE{
            
        }
        when BEFORE_DELETE{
            
        }
        when AFTER_INSERT{
            
        }
        when AFTER_UPDATE{
            
        }
        WHEN AFTER_DELETE{
            
        }
        WHEN AFTER_UNDELETE{
            
        }
    } 
}