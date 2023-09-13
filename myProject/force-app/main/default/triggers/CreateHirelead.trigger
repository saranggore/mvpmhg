trigger CreateHirelead on Contact (after insert) {
set<Id> con=new set<Id>();
    con=trigger.newMap.keySet();
    for(contact cc:trigger.new){
        
        HireLead__c hl=new HireLead__c();
       
    }
}