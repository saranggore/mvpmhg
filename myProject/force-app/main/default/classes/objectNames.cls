global with sharing class objectNames {
@AuraEnabled(cacheable=true)
global static Map<String,string> getAllCustomSObjects()
{
    integer i=0;
    Map<String,string> sObjectList = new Map<String,string>();
    for(Schema.SObjectType objTyp : Schema.getGlobalDescribe().Values())
    {
       if(i<500){
        Schema.DescribeSObjectResult describeSObjectResultObj = objTyp.getDescribe();
        
            String apiname = objTyp.getDescribe().getName();
            String name = objTyp.getDescribe().getLabel();
            // Exclude all the unwanted Sobjects e.g. History, Share etc.
           
                sObjectList.put(apiname,name);
        i=i+1;    
       
       }
}
    system.debug('SObjectList****' + sObjectList);
    return sObjectList;
}
}