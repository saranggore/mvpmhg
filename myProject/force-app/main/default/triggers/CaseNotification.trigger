trigger CaseNotification on Case (after insert) {
    if(trigger.isAfter){
        if(trigger.isInsert){
           //Create List of account Id
            List<Id> accId=new List<ID>();
            integer count=0;
            integer thirdSameday=0;
            for(case c1:trigger.new)
            {
                accId.add(c1.AccountId);
            }
            List<Case> caseInfo=[select Id,accountId,City__c,CreatedDate from case where accountId=:accId];
            for(case c2:trigger.new)
            {
                for(case c3:caseInfo)
                {
                    if(c2.AccountId==c3.AccountId && c2.City__c==c3.City__c)
                    {
                        count=count+1;
                    }
                    if(c2.AccountId==c3.AccountId && c3.CreatedDate==c2.CreatedDate)
                    {
                        thirdSameday=thirdSameday+1;
                    }
                }
                if(count==3)
                {
                    system.debug('Third Occourance');
                }
                if(count==5)
                {
                    system.debug('Fourth Occourance');
                }
                if(thirdSameday==3)
                {
                    system.debug('Three Cases on same day');
                }
            }
        }
    }
}