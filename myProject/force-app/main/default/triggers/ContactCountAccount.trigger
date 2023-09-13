trigger ContactCountAccount on Contact (after insert) {
    if(trigger.IsAfter && trigger.IsInsert){
        set<Id> accId=new set<Id>();
        for(contact con:trigger.new){
            accId.add(con.AccountId);
        }
        Map<Id,Integer> accountRecords=new Map<Id,integer>();
        List<Account> acListUpdate=new List<Account>();
        for(contact con2:[select id,AccountId from contact where Account.Id IN :accId]){
            integer acccheck=accountRecords.get(con2.AccountId);
            if(acccheck==null){
                accountRecords.put(con2.AccountId,1);
            }
            else{
                integer conCount=accountRecords.get(con2.AccountId);
                accountRecords.put(con2.AccountId,conCount+1);
            }
        }
        for(Id acc:accountRecords.keySet()){
            Account accUp= new Account();
            accUp.Id=acc;
            accup.Contact_Count__c=accountRecords.get(acc);
            acListUpdate.add(accUp);
        }
        if(!acListUpdate.IsEmpty()){
            update acListUpdate;
        }
    }
}