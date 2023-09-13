trigger OLIaddProdcuts on OpportunityLineItem (before insert,after insert) {
    
    if(trigger.isAfter && trigger.isInsert){
        set<Id> opportunityId=new set<Id>();
        Map<Id,List<string>> oppProductIdMap=new Map<Id,List<string>>();
        
        for(OpportunityLineItem oli:[select id,OpportunityId,Product2.Type__c from OpportunityLineItem where Id IN:Trigger.new]){
            if(!oppProductIdMap.containsKey(oli.OpportunityId)){
                oppProductIdMap.put(oli.OpportunityId,new list<string>{oli.Product2.Type__c});
            }
            else{
                oppProductIdMap.get(oli.OpportunityId).add(oli.Product2.Type__c);
            }
        }
        
        for(Id oppId:oppProductIdMap.keySet()){
            List<string> prodTypeList=oppProductIdMap.get(oppId);
            if(prodTypeList.contains('Consumable')){
                opportunityId.add(oppId);
            }
        }
        
        List<OpportunityLineItem> oliToInsert=new List<OpportunityLineItem>();
        for(Id oppId2:opportunityId){
            OpportunityLineItem oliToAdd=new OpportunityLineItem();
            oliToAdd.OpportunityId=oppId2;
            oliToAdd.Quantity =1;
            oliToAdd.PricebookEntryId='01u2v00000EiLXVAA3';
            oliToAdd.UnitPrice =500;
            oliToInsert.add(oliToAdd);
        }
      
        insert oliToInsert;
    }
}