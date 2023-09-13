public with sharing class SearchController {
    @AuraEnabled(Cacheable = true)
    public static List<PricebookEntry> retriveProducts(String strProdName,string priceBId) {
        strProdName = '%' + strProdName + '%';
        //List<Product2> lstProd = [SELECT  Id, Name, ProductCode FROM Product2 WHERE Name LIKE :strProdName];
        
        List<PricebookEntry> lstProduct = [Select Id,Product2.Name,Product2.ProductCode,UnitPrice,Product2.Description,Product2.Family  From PricebookEntry where Pricebook2Id =:priceBId and (Product2.Name LIKE :strProdName OR Product2.ProductCode LIKE :strProdName)];
        return lstProduct; 
    }

    @AuraEnabled
    public static void createOpportunityProduct(String oppProduct){
       List<OpportunityLineItem> oppProductList=(List<OpportunityLineItem>) System.JSON.deserialize(oppProduct, List<OpportunityLineItem>.Class);
       if(!oppProductList.isEmpty()){
           insert oppProductList;
        }
    }
}