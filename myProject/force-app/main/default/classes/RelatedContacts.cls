public with sharing class RelatedContacts {
        @AuraEnabled(cacheable=true)
        public static List<contact>  showContacts(string keySearch){
        List<contact> conList=[select id from contact where accountId=:keySearch];
        return conList;
        }
}