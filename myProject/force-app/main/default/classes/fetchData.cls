public with sharing class fetchData {
@AuraEnabled(cacheable=true)
public static List<contact> fetchDataRec(){
    return [select id,Name,Email,Phone from contact where email!='' limit 20];
}
}