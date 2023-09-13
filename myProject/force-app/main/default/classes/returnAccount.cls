public class returnAccount {
@AuraEnabled
    public static List<Account> getaccount(){
        List<Account> acc=[select Id,Name,Email__c,Industry,Ownership,Phone from account limit 20];
        return acc;
    }
}