trigger AccountUpdateAddress on Account (after update)
{
//scenario 1: Update  Phone number of all contacts when their account's phone number is changed
   /* 
    set<string> acId=new set<string>();
    for(Account acc:trigger.new)
    {
     acId.add(acc.Id);
    }
    List<contact> contacts=[SELECT Id, AccountId, OtherCity,Phone FROM Contact where AccountId=:acId];
    List<contact> updateCon=New List<contact>();
    for(Account acc:[select Id,BillingCity,Phone from account where Id=:acId])
    {
        for(contact con:contacts)
        {
           if(con.AccountId==acc.Id)
           {
               if(con.Phone!=acc.Phone)
               {
                   con.Phone=acc.Phone;
                   updateCon.add(con);
               }
           }
        }
    }
    update updateCon;
*/
 
//Scenario 2 : Contacts email update based on accounts email update    
    List<Contact> conc=new List<Contact>();
    Map<Id,Account> mapAcc=new Map<Id,Account>([select Id,Email__c from account where Id=:trigger.newMap.keySet()]);
    for(Contact contacts:[select Id,Email,AccountId  from contact where AccountId=:mapAcc.keySet()])
    {
        account acc1=mapAcc.get(contacts.AccountId);
        if(contacts.Email!=acc1.Email__c)
        {
            contacts.Email=acc1.Email__c;
            conc.add(contacts);    
        }
        
    }
    update conc;
}