trigger CaseTrigger on Case (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    switch on trigger.operationType{
        when BEFORE_INSERT{
			
        }
        when BEFORE_UPDATE{
            
        }
        when BEFORE_DELETE{
            
        }
        when AFTER_INSERT{

        }
        when AFTER_UPDATE{
            CaseUpdates.sendMail('wedward45@gmail.com', 'Theater Service Request update', 
                    'An update has been posted on a recent service request');

        }
        when AFTER_DELETE{
            
        }
        when AFTER_UNDELETE{
            
        }
    }
}