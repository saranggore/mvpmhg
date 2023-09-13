public class showFields {
    @AuraEnabled(cacheable=true)
    public static Map<String,String> giveFields(string objSearch)
    {
       // String objType='opportunity';
        //String key = '%'+objSearch+'%';
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(objSearch);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        Map<String,String> fieldsMap= new Map<String,String>();
        for (String fieldName: fieldMap.keySet()) {
          Schema.DisplayType fielddataType = fieldMap.get(fieldName).getDescribe().getType();
            string fieldLabel=fieldMap.get(fieldName).getDescribe().getLabel();
            fieldsMap.put(fieldLabel,String.valueOf(fielddataType));
            system.debug('FIeld------>'+fieldName);
            system.debug('FIeld DataTYpe------>'+fielddataType);
        }

        return fieldsMap;
       
    }


}