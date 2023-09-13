public with sharing class contactData {
    
    @AuraEnabled(cacheable=true)
    public static List<Lead> contactDatas() {
        List<Lead> conList=[select id,Name,Email from lead limit 10];
      return conList;
    }
}