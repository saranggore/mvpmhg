public class schema2 {
   public  List<string> demo{get;set;}
    public schema2(){
        schema.DescribeSObjectResult result=Profile.sobjectType.getDescribe();
        Map<string,sObjectField> fieldName=result.fields.getMap();
        set<string> just=fieldName.keySet();
        demo=new List<string>(just);
        
    }
}