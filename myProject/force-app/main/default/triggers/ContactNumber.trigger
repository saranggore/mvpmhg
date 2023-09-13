trigger ContactNumber on Contact (before insert) {
    List<string> accountId=new List<string>();
    Map<id,integer> accMap=new Map<id,integer>();
    for(contact con:trigger.new){
        accountId.add(con.AccountId);
    }
    for(account acc:[select id,(select id from contacts) from account where id=:accountId]){
        accMap.put(acc.id,acc.contacts.size());
    }
    for(contact contacts:trigger.new){
        contacts.Contact_Number__c=accMap.get(contacts.AccountId) + 1;
    }
}