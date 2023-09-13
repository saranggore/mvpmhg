public with sharing class fetCon {
    @AuraEnabled(Cacheable=true)
    public static List<contact> getcontacts() {
         return [select Id,Name,Email,Phone from contact limit 10];
    }
}