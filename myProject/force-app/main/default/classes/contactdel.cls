public class contactdel {
    public static void accdel()
    {
     List<Id> accounts=new List<Id>();          
       // for(Contact c:Trigger.old){
        //contact c=[select id,Account.Id from contact];   
              // accounts.add(c.AccountId);
        //}/
       List<Account> acc=[select id from account where Id in:accounts];
        delete acc;
            }
}