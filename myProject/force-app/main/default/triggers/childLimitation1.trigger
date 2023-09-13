trigger childLimitation1 on Contact (before insert) {
 if(trigger.isBefore && Trigger.isInsert)
    {
        set<Id> accountId= new set<Id>();
        Map<Id,integer> numberContacts=new Map<Id,integer>();
        for(contact con:trigger.new)
        {
            accountId.add(con.accountId);
        }
        for(Account acc:[select id, (SELECT id FROM Contacts) from account where id IN:accountId])
        {
            numberContacts.put(acc.id,acc.contacts.size());
        }
        for(contact cont:trigger.new)
        {
           integer counting=numberContacts.get(cont.accountId);
            system.debug('Counting='+counting);
            if(counting >4)
            {
                cont.addError('Number of contacts on account are more than 5');
            }
               
        }
    }
}