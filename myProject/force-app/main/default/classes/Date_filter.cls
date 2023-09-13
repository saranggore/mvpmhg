////practice of date filter
public class Date_filter {
 public Date_filter(apexPages.StandardController controller)
    {
        
    }
///Date filter use in SOQL
    public void dateFilter(){
    //show all accounts which are created Today
        List<Account> acc1=[select Id,name from account where createdDate=TODAY];
    //show all accounts which are created Tomorrow
        List<Account> acc2=[select Id,name from account where createdDate=TOMORROW];
    //show all accounts which are created Last week
        List<Account> acc3=[select Id,name from account where createdDate=LAST_WEEK];
    //show all accounts which are created This Week
        List<Account> acc4=[select Id,name from account where createdDate=THIS_WEEK];
    //show all accounts which will be created Next week
        List<Account> acc5=[select Id,name from account where createdDate=NEXT_WEEK];
    //show all accounts which are created This Month
        List<Account> acc6=[select Id,name from account where createdDate=THIS_MONTH];
    //show all accounts which will be created next month
        List<Account> acc7=[select Id,name from account where createdDate=NEXT_MONTH];
    //show all accounts which are created last month
        List<Account> acc8=[select Id,name from account where createdDate=LAST_MONTH];
        
         ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Accounts created TODAY--->'+JSON.serialize(acc1)));
         ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Account TOMORROW--->'+JSON.serialize(acc2)));
         ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Accounts created LAST_WEEK--->'+JSON.serialize(acc3)));
         ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Accounts created THIS_WEEK--->'+JSON.serialize(acc4)));
         ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Accounts NEXT_WEEK--->'+JSON.serialize(acc5)));
         ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Accounts created THIS_MONTH--->'+JSON.serialize(acc6)));
         ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Accounts NEXT_MONTH--->'+JSON.serialize(acc7)));
         ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Accounts created LAST_MONTH--->'+JSON.serialize(acc8)));
        
        
    }
}