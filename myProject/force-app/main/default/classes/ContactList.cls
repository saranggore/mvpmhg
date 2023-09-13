public with sharing class ContactList {
    @AuraEnabled(cacheable=true)
    public static List<contact> conList(){
      List<contact> contacts=[select id,name,email from contact where email!=''];
      return contacts;
    }
}