public class AmountRollupHelper {
///Rollup summary operation after record is inserted or record is updated
    public  void rollUpInsert(List<Contact> conList){
        Map<Id,decimal> amountMap=new Map<Id,decimal>();
        List<Id> accountId=new List<Id>();
        //fetch account Id in list
        for(contact con:conList)
        {
            accountId.add(con.AccountId);     
        }
        //put account id and amount value in map
        for(contact contactFetched:[select id,AccountId,Amount__c from contact where accountId=:accountId])
        {
            decimal conAmount;
            decimal amo=0;
            //fetch amount associated with  account
            amo=amountMap.get(contactFetched.AccountId);
            if(amo!=null && contactFetched.Amount__c!=null)
            {
                //add account amount with contact
                conAmount=amo +contactFetched.Amount__c;
                amountMap.put(contactFetched.AccountId, conAmount);
            }
            else
            {
                //put account id vs contact amount in map
                amountMap.put(contactFetched.AccountId, contactFetched.Amount__c);
            }
            
        }
        //update account with Rollup amount values
        set<Id> accId=amountMap.keySet();
        List<Account> accList = new List<Account>();
        for(Account acc:[select id from account where id=:accId])
        {
            decimal accROllup=amountMap.get(acc.Id);
            Account accNew=new Account();
            accNew.id=acc.Id;
            accNew.Total_Amount__c=accROllup;
            accList.add(accNew);
        }
        update accList;
    }
    
///Rollup summary operation after record is deleted  
    public  void rollUpDelete(List<contact>conOldList){
        Map<Id,decimal> amountIdMap=new Map<Id,decimal>();
        Map<Id,decimal> amountAmountMap=new Map<Id,decimal>();
        List<Id> accountIdlist=new List<Id>();
        List<Id> contactId=new List<Id>();
        //fetch account Id in list
        for(contact con:conOldList)
        {
            accountIdlist.add(con.AccountId);
            contactId.add(con.Id);
        }
        for(account account1:[select id,Total_Amount__c from account where id=:accountIdlist]){
            amountAmountMap.put(account1.Id,account1.Total_Amount__c);
        }
        //put account id and amount value in map
        for(contact contactFetched:[select id,AccountId,Amount__c from contact where Id=:contactId])
        {
            decimal conAmount1;
            decimal amo;
            //fetch amount associated with  account
            amo=amountAmountMap.get(contactFetched.AccountId);
            system.debug('Amount on acccount------>'+amo);
             if(amo!=null && contactFetched.Amount__c!=null)
            {
                //add account amount with contact
                conAmount1=amo - contactFetched.Amount__c;
                system.debug('Amount after substraction----->'+conAmount1);
                amountAmountMap.put(contactFetched.AccountId, conAmount1);
            }
        }
        //update account with Rollup amount values
        set<Id> accId1=amountAmountMap.keySet();
        List<Account> accList1 = new List<Account>();
        for(Account acc:[select id from account where id=:accId1])
        {
            decimal accROllup=amountAmountMap.get(acc.Id);
            Account accNew=new Account();
            accNew.id=acc.Id;
            accNew.Total_Amount__c=accROllup;
            accList1.add(accNew);
        }
        update accList1;
    }
}