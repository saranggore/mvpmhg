public with sharing class accountData {
    @AuraEnabled(cacheable=true)
    public static List<Account> getaccountDatademo() {
      return [select Id,Name,Type from account limit 5];
    }
    @AuraEnabled
    public static List<Account> getaccList(){
      
        return [select Id,Name,Type from account limit 15];
      
    }
}