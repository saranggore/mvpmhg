public class excHandling {
    public static void careee()
    {
        
        for(integer i=1;i<=101;i++)
           {
         try{
             List<Account> acc=[select Id from Account];
            }   
         catch(exception e)
        {
            system.debug('Error');
            break;
        }      
        }
        
    }
}