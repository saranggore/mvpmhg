trigger caseHis on Case (after update) {
     
integer size=trigger.new.size();
for(integer i=0;i<=size-1;i++)
{
    Case NewCase = trigger.new[i]; 
    Case OldCase = trigger.old[i]; 
    Case CaseObject = new Case(); 
    //Schema.SObjectType objType = CaseObject.getSObjectType(); 
    //Map<String, Schema.SObjectField> M = Schema.SObjectType.Case.fields.getMap(); 
    String type='Case';
    Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
    Schema.SObjectType leadSchema = schemaMap.get(type);
    Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();  
    List<History_Case__c> lastUpdate=new List<History_Case__c>();
    system.debug('------------------>One');
for (String str : fieldMap.keyset())
 {
    try
     { 
        //System.debug('Field name: '+str +'. New value: ' + NewCase.get(str) +'. Old value: '+OldCase.get(str)); 
        if(NewCase.get(str) != OldCase.get(str) && str!='LastModifiedById' && str!='SystemModstamp')
          { 
              if(str!='RecordTypeId')
              {
               History_Case__c caseHist=new History_Case__c();
               caseHist.Case__c=NewCase.Id;
               caseHist.Field_Name__c= fieldMap.get(str).getDescribe().getLabel();
               caseHist.New_value__c=String.valueof(NewCase.get(str));
               caseHist.Old_value__c=String.valueof(OldCase.get(str));
               lastUpdate.add(caseHist);
                  system.debug('------------------>Two');
              }
              if(str=='RecordTypeId'){
               History_Case__c caseHist=new History_Case__c();
               caseHist.Case__c=NewCase.Id;
               caseHist.Field_Name__c= 'Record Type Name';
               string strRecordTypeId=String.valueof(NewCase.get(str));
               caseHist.New_value__c= Schema.getGlobalDescribe().get('Case').getDescribe().getRecordTypeInfosById().get(strRecordTypeId).getName();
               string strRecordTypeId2=String.valueof(OldCase.get(str));
               caseHist.Old_value__c=Schema.getGlobalDescribe().get('Case').getDescribe().getRecordTypeInfosById().get(strRecordTypeId2).getName();
                  lastUpdate.add(caseHist);
              }
              if(str=='LastModifiedById')
              {
               History_Case__c caseHist=new History_Case__c();
               caseHist.Case__c=NewCase.Id;
               //caseHist.Field_Name__c= fieldMap.get(str).getDescribe().getLabel();
               caseHist.User__c =UserInfo.getName();
               lastUpdate.add(caseHist);
              }
          } 
     } 
   catch (Exception e) 
     { 
       System.debug('Error: ' + e);
         system.debug('------------------>Three');
     }
 } 
 insert lastUpdate;
    system.debug('------------------>Four'+lastUpdate.size());
 }
}