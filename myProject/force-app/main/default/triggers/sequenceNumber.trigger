trigger sequenceNumber on Task_Details__c (before update) {
   if(trigger.isUpdate && trigger.isbefore)
   {
       set<Id> can=new set<Id>();
       for(Task_Details__c TD:trigger.new)
       {
           can.add(TD.Candidate_Id__c);
       }
       for(Task_Details__c TD2:trigger.new)
       {
           string seq;
           seq=TD2.Sequence_Number__c;
           for(Id canId:can)
           {
               
               List<Task_Details__c> canTd=[select Id,Status__c,
                                            Sequence_Number__c from Task_Details__c 
                                            where Candidate_Id__c=:canId];
               integer size=canTd.size();
               while(size!=0)
               {
                   if(canTd[size-1].Sequence_Number__c<seq && canTd[size-1].Status__c=='Draft')
                   {
                       TD2.addError('Please compleet previous tasks');
                       size --;
                   }
                   else{
                       size--;
                       continue;
                   }
               }
           }
       }
   }
}