////Showing accounts without using limit
public class showAccounts 
{
    public showAccounts(ApexPages.StandardController controller)
    {
        
    }
///Show only 10 Account records using break  
    public static void onlyTenAccount()
    {
        for(integer i=1;i<20;i++)
        {
            list<Account> acc=[select Id,Name from account];
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Account Name----->'+acc[i].Name));
            if(i>9)
            {
                break;
            }
        }
    }
}