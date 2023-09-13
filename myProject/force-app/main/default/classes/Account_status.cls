public class Account_status {
    public Account_status(){
        Map<Id,List<contact>> demo=new Map<Id,List<contact>>();
        List<Account> acc=[select Id,status__c,(select Id,status__c from contacts) from account];
        for(account a:acc){
            for(contact c:[select id,status__c from contact where accountId=:a.Id])
            {
              if(c.status__c=='completed')
              {
                  
              }
        }
        
    }
}
}