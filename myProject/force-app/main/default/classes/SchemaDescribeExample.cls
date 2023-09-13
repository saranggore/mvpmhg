public class SchemaDescribeExample {
    public Map<string,schema.SObjectType> objMap  {set;get;}
    public List<string> objectNames      {set;get;}
    public List<string> fieldNames       {set;get;}
    public List<string> selectedFields   {set;get;}
    public List<selectoption> objectList {set;get;}
    public List<selectoption> fieldsList  {set;get;}
    public string query                  {set;get;}
    public string selected               {set;get;}
    
    public SchemaDescribeExample(){
        objectNames=new List<string>();
        fieldNames=new List<string>();
        selectedFields=new List<string>();
        objectList=new List<selectoption>();
        fieldsList=new List<selectoption>();
        
        objMap=schema.getGlobalDescribe();
        set<string> names=objMap.keySet();
        //selectOption none=new selectOption('none','none');
        //objectList.add(none);
        for(string s:names){
            schema.sobjecttype obj=objMap.get(s);
            schema.DescribeSObjectResult result=obj.getDescribe();
            if(result.isCustom()){
                string n=result.getName();
                objectNames.add(n);
                SelectOption op=new SelectOption(n,n);
                objectList.add(op);
            }
            
        }
        
    }
    public void getfields(){
        
       
        
            schema.SObjectType obj=objMap.get(selected);
            schema.describeSObjectResult result=obj.getDescribe();
            Map<string,schema.SObjectField> fldMap=result.fields.getMap();
            set<string> fields=fldMap.keyset();
            fieldNames.clear();
            fieldNames.addall(fields);
        system.debug(fields);
        
        create();
        
     
    
    }
    public void create(){
       fieldsList.clear();
        if(fieldNames.size()>0){
            for(string s: fieldNames){
                selectOption op=new selectOption(s,s);
                fieldsList.add(op);
                
            }
        }else{
             selectOption none=new selectOption('none','-None-');
            fieldsList.add(none);
            //system.debug('RRRRRRRRRRRRRRRRRRRRRRRRR'+FieldList);
        }
    }
    public void createQuery(){
        query='select id';
        for(string s:fieldNames){
            if(s!='Id'){
                query=query+','+s;
            }
        }
        query=query+' from ' +selected;
    }
}