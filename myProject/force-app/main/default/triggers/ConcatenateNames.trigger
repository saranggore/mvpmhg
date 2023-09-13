//Concatenate product names on Opportunity field
trigger ConcatenateNames on OpportunityLineItem (after insert) {
    if(trigger.isAfter && trigger.isInsert)
    {
        Set<Id> allInsertedIds = trigger.newMap.keySet();
        Map<Id,string> oppMap=new Map<Id,string>();
        List<opportunity> oppUpdateList=new List<opportunity>();
      //Store opportunity Id and product name in Map
        for(OpportunityLineItem oppLine:[SELECT Id, Name,product2.name,
                                         OpportunityId FROM OpportunityLineItem 
                                         where Id=: allInsertedIds])
        {
            oppMap.put(oppLine.OpportunityId,oppLine.product2.name);
        }
        
        //Concatenate product name with Opportunity field "Product Names"
        for(opportunity opportuntySelected:[select id,Product__c from opportunity where id=:oppMap.keyset()])
        {
            opportunity oppUpdate=new opportunity();
            oppUpdate.id=opportuntySelected.id;
            oppUpdate.Product__c=opportuntySelected.Product__c +' ,'+oppMap.get(opportuntySelected.Id);
            oppUpdateList.add(oppUpdate);
        }
        if(oppUpdateList.size()>0){
        update oppUpdateList;    
        }
        
    }
}