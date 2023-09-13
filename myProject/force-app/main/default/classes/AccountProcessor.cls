global class AccountProcessor
{
    @future
   public  static void countContacts(set<id> setId)
   {
       List<Account> acc=[select Name from account where id =:setId];
       for(Account a:acc)
       {
           List<contact> dd=a.contacts;
           a.Number_of_Contacts__c=dd.size(); 
           update a;
       }      
   }
}