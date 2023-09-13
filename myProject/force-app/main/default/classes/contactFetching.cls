public with sharing class contactFetching {
    @AuraEnabled(cacheable=true)
    public static contact provideContact(){
        return [select id,Name,email from contact where email!='' limit 1];
    }
}