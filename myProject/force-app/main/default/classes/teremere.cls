public class teremere {
public static void maera(Map<Id,account>oldmap,Map<Id,account> newmap)
{
    set<id> recordId=oldmap.keyset();
    List<Id> accIds=new List<Id>();
    for(Id key:recordId){
    account old=oldmap.get(key);
    account neww=oldmap.get(key);
        if(old.phone!=neww.Phone){
            
            accIds.add(key);
        }
    
    }
    List<contact> conta=[select Id,otherphone,mobilePhone from contact where AccountId in:accIds];
    for(contact c:conta)
    {
        Id key=c.accountId;
        account a=oldmap.get(key);
        c.otherphone=a.phone;
    }
    update conta;
}
}