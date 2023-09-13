////Use SOQL query with sobject
public class practiceExample4 
{
     public static string objectName {get;set;}
     public static string fieldName  {get;set;}
  
  public practiceExample4(apexPages.StandardController controller)
  {
   
  }
    public static void nameReturn()
    {
      string queryy='select Id,Name from '+ objectName+' limit 1';
      sobject contLst=Database.query(queryy);
      string Name=''+ contLst.get(fieldName);
      ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.INFO,'Record for selected sobject is'+JSON.serialize(contLst) ));
      ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.INFO,'Record Name is'+JSON.serialize(Name) ));
        
        sObject recordds = Schema.getGlobalDescribe().get(objectName).newSObject() ;
        recordds.put('Name',fieldName) ;
        insert recordds ;
    }
}