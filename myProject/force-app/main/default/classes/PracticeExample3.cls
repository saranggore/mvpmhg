////Dynamic SOQL practice example 
public class PracticeExample3 
{
  public static string objectName {get;set;}
  public integer num=2; 
  
  public practiceExample3(apexPages.StandardController controller)
  {
   
  }
  ///obtain object name from user input and implement pagination with Dynamic soql  
  public pagereference pagi()
  {
     string query='select id from ' + objectName +' limit 2 offset '+ num;
     try
     {
     list<Sobject> acc=Database.query(query);
     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Selected object records are --->'+JSON.serialize(acc)));
     num=num+2;
     }
     catch(exception e)
     {
     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.error,'Error --->'+e.getMessage()));     
     } 
     return null;
  }
  ///obtain object name from user input and show records using dynamic soql
  public pagereference search()
  {
     try
     {
     string query='select id from ' + objectName +' limit 2';
     list<Sobject> acc=Database.query(query);
     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Selected object records are --->'+JSON.serialize(acc)));
     }
     catch(exception e)
     {
     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.error,'Error --->'+e.getMessage()));     
     } 
     return null;
  }
}