public class acccandcont 
{
   public Map<string,List<string>> kare{get;set;}
    public acccandcont()
    {
       
        kare=new Map<string,List<string>>();
        List<Account> acclist =  [Select Name,BillingCountry,(select Name from contacts)FROM Account];
        for(Account acc:acclist)
        {
            List<string> relatedco=new List<string>();
            for(contact coo:acc.contacts)
            {
               string no=coo.Name;
               relatedco.add(no); 
            }
            kare.put(acc.Name,relatedco);
            
        }
        
    }
}