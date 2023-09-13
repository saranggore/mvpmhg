public class contactTriggerHandler {
    public static void executeTrigger(List<contact> conList,Map<Id,Contact>conMap){
        set<Id> accountSet=new set<Id>();
        Map<Id,List<Integer>> accountSalary=new map<Id,List<Integer>>();
        map<Id,Integer> miniValue=new map<Id,Integer>();
        map<Id,Integer> maxiValue=new map<Id,Integer>();
        for(contact con:conList){
            if(con.AccountId!=null){
                accountSet.add(con.AccountId);
            }
        }
        for(contact contactList:[select id,Salary__c,AccountId from contact where accountId IN :accountSet]){
            if(!accountSalary.containsKey(contactList.AccountId)){
                accountSalary.put(contactList.AccountId,new list<Integer>());
            }
            else{
                List<Integer> salaryList=accountSalary.get(contactList.AccountId);
                if(contactList.Salary__c!=null){
                    salaryList.add(integer.valueOf(contactList.Salary__c));
                accountSalary.put(contactList.AccountId,salaryList);
                }
                
            }
        }
        
        for(Account acc:[select id from Account where Id IN:accountSalary.keySet()]){
            List<Integer> conlis=accountSalary.get(acc.Id);
             system.debug('conlis---->'+conlis);
            conlis.sort();
            integer minValue=conlis.get(0);
            system.debug('minValue---->'+minValue);
            integer maxValue=conlis.get(conlis.size()-1);
            miniValue.put(acc.Id,minValue);
            maxiValue.put(acc.Id,maxValue);
        }
        List<Account> accUpdateList=new List<Account>();
        for(Id acccId:accountSalary.keySet()){
            Account accUpdate=new Account();
            accUpdate.Id=acccId;
            accUpdate.Minimum_Salary__c=miniValue.get(acccId);
            accUpdate.Maximum_Salary__c=maxiValue.get(acccId);
            accUpdateList.add(accUpdate);
        }
        update accUpdateList;
    }
    public static void primaryContact(List<contact> contactList){
        set<Id> accountId=new set<Id>();
        Map<Id,string> accMap=new Map<Id,String>();
        for(Contact conPrimary:contactList){
            if(conPrimary.Primary_Contact__c==true){
                accountId.add(conPrimary.AccountId);
            }
        }
        for(contact cList:[select id,Primary_Contact__c,AccountId from contact where Primary_Contact__c=true and AccountId IN :accountId]){
            accMap.put(cList.AccountId,'true');
        }
        for(Contact conPrimaryCheck:contactList){
            if(accMap.containsKey(conPrimaryCheck.AccountId)){
                conPrimaryCheck.adderror('There is already primary contact on account');
            }
        }
    }
}