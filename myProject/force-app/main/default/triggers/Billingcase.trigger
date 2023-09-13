trigger Billingcase on Account (before insert,before update) {
    if(trigger.isUpdate && trigger.isbefore){
        for(account acc:trigger.new){
            
            if(acc.BillingAddress!=Trigger.oldMap.get(acc.ID).BillingAddress){
              //  acc.BillingStreet='Try Again';
            //acc.Has_Support_Plan__c=!(Trigger.oldMap.get(acc.ID).Has_Support_Plan__c);
            }
        }
    }
}