public class CampingListController {
@AuraEnabled
    public static List<Camping_Item__c> getItems()
    {
        List<Camping_Item__c> acc=[select Id,Name,Price__c,Quantity__c,Packed_form__c from Camping_Item__c ];
        return acc;
    }
@AuraEnabled
    public static Camping_Item__c saveItem (Camping_Item__c item)
    {
        insert item;
        return item;
    }    
}