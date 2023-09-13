public class AccountUtility {
    public static void viewAnnualRevenue(){
        List<Account> accountsList=[select  Name,AnnualRevenue from account];
        for(account acc:accountsList){
            string acctRev=acc.Name+':'+acc.AnnualRevenue;
            system.debug(acctRev);
        }
    }
}