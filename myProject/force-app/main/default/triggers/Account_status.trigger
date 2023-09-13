trigger Account_status on Account ( after update) {
    
boolean flag;
        Map<Id,List<contact>> demo=new Map<Id,List<contact>>();
    List<account> yaro=new List<account>();
        List<Account> acc=[select Id,status__c,(select Id,status__c from contacts) from account];
        for(account a:acc)
        {
           demo.put(a.id,a.contacts);
            
        }
    for(Id key:demo.keyset())
    {
       set<Account> trio=new set<Account>();
        
        for(contact  c:[select status__c from contact where accountId=:key])
        {
            if (c.Status__c=='completed')
            {
                flag=true;
            }else
            {
                flag=false;
                
            }
        }
        if(flag!=false)
        {
            account ac=new account();
            ac.id=key;
            ac.Status__c='completed';
            yaro.add(ac);
        }
    }

update yaro;


}