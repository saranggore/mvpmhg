public with sharing class contactController2 {
   @AuraEnabled(cacheable=true)
 public static List<Contact> contactReturn(){
     return [select Id,Name from contact limit 5];
 }
}