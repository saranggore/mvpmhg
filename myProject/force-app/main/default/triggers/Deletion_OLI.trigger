trigger Deletion_OLI on OpportunityLineItem (after delete) {
List<Deleted_Products__c> mayur=new List<Deleted_Products__c>(); 
    for(OpportunityLineItem oppo:Trigger.old)
{
    	Deleted_Products__c demo=new Deleted_Products__c();
          demo.Id__c=oppo.Product2Id;
          demo.Name=oppo.ProductCode;
          mayur.add(demo);
    
}
    insert mayur;
}