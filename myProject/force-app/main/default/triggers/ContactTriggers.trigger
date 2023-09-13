trigger ContactTriggers on Contact (before insert,after insert,after update) {
    if(trigger.isAfter && trigger.isInsert){
        contactTriggerHandler.executeTrigger(trigger.new,trigger.oldMap);
    }
    if(trigger.isAfter && trigger.isUpdate){}
    if(trigger.isBefore && trigger.isInsert){
        contactTriggerHandler.primaryContact(trigger.new);

    }
}