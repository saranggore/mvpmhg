public with sharing class showItems {
    @AuraEnabled(cacheable=true)
    public static List<OpportunityLineItem> retProducts(Id oppId){
        List<OpportunityLineItem> prodList=[select id,Product2.Name,Quantity,UnitPrice,ServiceDate,Description from OpportunityLineItem where OpportunityId=:oppId ];
        return prodList;
    }

    @AuraEnabled(cacheable=true) 
    public static Integer getCount(Id oppId) {
        return [select count() from OpportunityLineItem where OpportunityId=:oppId];
    }

    @AuraEnabled(cacheable=true) 
    public static List<Pricebook2> retPricebook(){
        List<Pricebook2> pbData=[select id,Name from Pricebook2  where IsActive=true];
        return pbData;
    }

    @AuraEnabled() 
    Public static void deletProd(Id oppId){
        List<OpportunityLineItem> deleteProdList=[select id from OpportunityLineItem where OpportunityId=:oppId];
        delete deleteProdList;
    }
}