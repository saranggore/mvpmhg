public with sharing class AccountListControllerLwc {
    public AccountListControllerLwc() {

    }
    @AuraEnabled(cacheable=true)
public static List<Account> queryAccountsByRevenue(String searchKey) {
    String key = '%'+searchKey+'%';
    return [
        SELECT Name,Phone,Email__c,Type
        FROM Account where Name LIKE :key
        
    ];
}
}