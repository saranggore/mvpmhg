////Perform Dml operations on sobject
public class Practic_Example6_Atmic_nonAtomic {
 public static string objectName {get;set;}
 public static string fieldName  {get;set;}
  
  public Practic_Example6_Atmic_nonAtomic(apexPages.StandardController controller)
  {
   
  }
  ///Perform dml operation using atomic and non atomic functions.
  public static void atomicNonAtomic()
  {
    string queryy='select Id,Name from '+ objectName+' limit 4';
    List<sobject> accntLst=Database.query(queryy);
    accntLst[0].put('Name',fieldName);
    accntLst[1].put('Name',fieldName);
    accntLst[2].put('Name',fieldName);
    accntLst[3].put('Name','');
    List<Database.SaveResult> result=Database.update(accntLst,false);      
      for(Database.SaveResult r:result){
          if(r.isSuccess())
          {
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.INFO,'Record for is Updated successfully'+JSON.serialize(accntLst)));   
          }
          else
          {
              Database.Error[] errors=r.getErrors();
              for(Database.Error er:errors)
              {
                 ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.INFO,'Record Update Failed: Error-->'+er.getMessage())); 
              }
          }
      }   
  }  
}