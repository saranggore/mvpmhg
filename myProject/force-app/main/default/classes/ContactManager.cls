public with sharing class ContactManager {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContact(integer con) {

      return [select id,Name,phone from Contact limit:con];
    }
}