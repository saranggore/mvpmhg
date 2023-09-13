////DMl operation on Sobject
public class practiceExample5 {
  public static string objectName {get;set;}
  public static string fieldName  {get;set;}
  
  public practiceExample5(apexPages.StandardController controller)
  {
   
  }
  ///perform dml operation on sobject 
  public static void dmlOperations()
  {
    sObject recordds = Schema.getGlobalDescribe().get(objectName).newSObject() ;
    recordds.put('Name',fieldName) ;
    insert recordds ; 
  }
}