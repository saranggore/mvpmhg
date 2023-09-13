trigger contactDescriptionUpdate on Contact (after insert,after update) {

    if(trigger.isUpdate && trigger.isAfter)
    {
        Map<Id,string> AccountMap= new Map<Id,string>();
        Map<Id,string> AccountMapDescription= new Map<Id,string>();
        set<Id> accId=new set<Id>();
        List<Account> updateAccount=new List<Account>();
        for(contact cont:[select Id,Description,AccountId from contact where Id=:trigger.new])
        {
            AccountMap.put(cont.AccountId,cont.Description);
            accId.add(cont.AccountId);
        }
        for(Account acc:[select Id,Description from Account where Id=:accId])
        {
            AccountMapDescription.put(acc.Id,acc.Description);
        }
        for(Id accoun:accId){
            Account accInstance= new Account();
            accInstance.Description=AccountMapDescription.get(accoun) + AccountMap.get(accoun);
            accInstance.Id=accoun;
            updateAccount.add(accInstance);
        }
        update updateAccount;
    }
}