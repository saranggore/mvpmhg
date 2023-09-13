public class opporandchilds {

 public List<opportunity> feel{get;set;}
 public  opporandchilds()
    {
     feel=[select name,stageName,Account.Name,(select role from opportunitycontactroles) from opportunity ];   
    }
}