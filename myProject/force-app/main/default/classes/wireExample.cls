public with sharing class wireExample {
    @AuraEnabled(cacheable=true)
    public static List<Contact> findContact(string name){
        String key = '%' + name + '%';
        return [
            SELECT Id, Name, Title, Phone, Email
            FROM Contact
            WHERE Name LIKE :key
            WITH SECURITY_ENFORCED
            LIMIT 10
        ];
    }
}