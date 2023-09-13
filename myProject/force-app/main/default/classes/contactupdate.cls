public class contactupdate {
    public static void trimo(Map<Id,Account> oldMap,Map<Id,Account> newMap)
    {
        List<Id> accs= new List<Id>();
        //List<Id> accs=new List<Id>();
        for(Id key:oldMap.Keyset())
        {
            Account old=oldMap.get(key);
            Account newac=oldMap.get(key);
            if(old.Phone!=newac.Phone)
            {
                accs.add(key);
            }
        }
        List<contact> cont=[select otherphone,mobilephone,AccountId from contact where AccountId in:accs];
        for(contact c:cont){
            
            c.otherphone=newMap.get(c.accountId).phone;
            c.mobilePhone=oldMap.get(c.AccountId).phone;
        }
    update cont;
    }
}