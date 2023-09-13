public with sharing class carController {

    public class Filters{
     @AuraEnabled
     public string searchKey {get;set;} 
     @AuraEnabled
     public decimal maxPrice {get;set;}
     @AuraEnabled
     public string[] categories {get;set;}
     @AuraEnabled
     public string[] makeType {get;set;}
    }
    @AuraEnabled(cacheable=true)
    public static List<Car__c> carDetails(Filters filters){
        string key, whereclause='';
        decimal maxPrice;
        string[] categories, makeType, criteria=new List<string>{};

        if(filters!=null){
            maxPrice=filters.maxPrice;
            categories=filters.categories;
            makeType=filters.makeType;
            if(!string.isEmpty(filters.searchKey)){
                key='%' +filters.searchKey+ '%';
                criteria.add('Name LIKE:key');
            }
            if(filters.maxPrice >=0){
                criteria.add('MSRP__c <=:maxPrice');
            }
            if(filters.categories !=null){
                criteria.add('Category__c IN :categories');
            }
            if(filters.makeType !=null){
                criteria.add('Make__c IN :makeType');
            }
            if(criteria.size()>0){
                whereclause= 'where ' + String.join(criteria,' AND ');
            }
            
        }
        
        string query='select id,Name,Category__c,Control__c,Description__c,Fuel_Type__c,Make__c,MSRP__c,seats_c__c,Picture_URL__c from Car__c ' + whereclause + ' WITH SECURITY_ENFORCED ORDER BY Name';
     return Database.query(query);
    }
}