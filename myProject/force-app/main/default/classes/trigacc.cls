public class trigacc {
    public static void tric(Map<Id,Account> oldMap,Map<Id,Account> newMap)
    {
        set<Id> recordIds=oldMap.keyset();
        List<Id> accIds= new List<Id>();
        for(Id key:recordIds)
        {
            Account old=oldMap.get(key);
            Account acc=newMap.get(key);
            if(old.phone!=acc.phone)
            {
                accIds.add(key);
            }
            
        }
      List<contact> contacts=[select id,accountId,otherphone,mobilephone from contact where AccountId In:accIds];
        for(contact c:contacts)
        {
            Id key=c.accountId;
            Account old=oldMap.get(key);
            Account acc=newMap.get(key);
            c.otherPhone=old.Phone;
            c.mobilePhone=acc.Phone;
            
        }
    update contacts;
    }
    
}