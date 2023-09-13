trigger CaseCount on Case (after insert) {
    if(trigger.isAfter){
        if(trigger.isInsert){
            CaseCountTrigger.demo1(trigger.new);
        }    
    }
    
}