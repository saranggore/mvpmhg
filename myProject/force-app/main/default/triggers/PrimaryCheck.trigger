trigger PrimaryCheck on Contact (before insert,before update) {
    if((trigger.IsInsert || trigger.IsUpdate) && trigger.IsBefore){
        
        set<Id> accountIdSet=new set<Id>();
        Map<Id,Integer> accountMap=new Map<Id,Integer>();
        
        for(contact con:trigger.new){
            if(con.AccountId!=null){
            if(con.Primary__c=true){
                accountIdSet.add(con.AccountId);
            }
          }
            
        }
        
        for(contact primaryContact:[select id,AccountId,Primary__c from contact where account.Id IN: accountIdSet and Primary__c=true]){
           integer count=0;
           count=accountMap.get(primaryContact.AccountId);

            if(count==null){

                accountMap.put(primaryContact.AccountId,1);
            }
            else{
                accountMap.put(primaryContact.AccountId,count+1);

            }
            
        }
    
        for(Contact con:Trigger.new){
            integer primaryCount=accountMap.get(con.AccountId);
             system.debug('primaryCount'+primaryCount);
            if(primaryCount >1){
                system.debug('primaryCount'+primaryCount);
                con.addError('Should Not have more than pne primary contact');
            }
        }
    
    
    }
}