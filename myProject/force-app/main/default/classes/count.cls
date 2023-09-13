public class count {
public account demo1 {get;set;}
//public integer cons {get;set;}    
 
    public static void demo()
{
    
 List<integer> cons=new List<integer>(); 
      List<account> demo1=new List<account>();
          demo1=[select Name,phone,(select name from contacts )from account];
    system.debug(demo1);
    for(account acc:demo1)
    {
      integer s=acc.contacts.size();
      cons.add(s);
        
    }
}
}