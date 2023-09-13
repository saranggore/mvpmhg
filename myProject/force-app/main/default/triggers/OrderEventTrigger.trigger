trigger OrderEventTrigger on Order_Event__e (after insert) {
 list<task> demo1=new list<task>();
    for (Order_Event__e event : Trigger.New) {
        if (event.Has_Shipped__c == true) {
            // Create Case to dispatch new team.
            task cs = new task();
            cs.Priority='Medium';
            cs.Subject='Follow up on shipped order ' + event.Order_Number__c;
            cs.OwnerId=event.CreatedById;
            demo1.add(cs);
        }
   }
    insert demo1;
}