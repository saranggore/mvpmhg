public class showAccount {
 @AuraEnabled
    public static List<Account> demo1(){
        List<Account> accList=[select Name,Email__c,Phone from account limit 10];
        return accList;
    }
}