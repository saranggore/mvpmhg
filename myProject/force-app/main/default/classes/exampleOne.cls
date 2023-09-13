public with sharing class exampleOne {
    @AuraEnabled(cacheable=true)
    public static List<Account> exampleOnedddddddddddd() {
      return [select Id,Name from Account limit 4];
    }
}