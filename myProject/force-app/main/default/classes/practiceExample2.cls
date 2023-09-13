////Wild card in soql
public class practiceExample2 
{
    public practiceExample2(apexPages.StandardController controller)
    {
        
    }
///use of % and _ wild card   
 public static void soql()
    {
           string semi='%\\_%';
        //show all accounts whose name starts with 'A'
           List<Account> acc=[select Id,Name from account where Name like 'A%'];
        //show all accounts whose name Ends with 'Z'
           List<Account> acc1=[select Id,Name from account where Name like '%Z'];
        //show all accounts whose name contain '
           List<Account> acc3=[select Id,Name from account where Name like '%\'%' ];
        //show all accounts whose name have exactly five characters
           List<Account> acc4=[select Id,Name from account where Name like '_____'];
        //show all accounts whose name contain _
           List<Account> acc5=[select Id,Name from account where Name like : semi];
        
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Account whoes Name starts with A--->'+JSON.serialize(acc)));
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Account whoes Name ends with Z--->'+JSON.serialize(acc1)));
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Account whoes Name Contain single inverted comma--->'+JSON.serialize(acc3)));
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Account whoes Name contain 5 character--->'+JSON.serialize(acc4)));
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Account whoes Name Contain underscore--->'+JSON.serialize(acc5)));
       
    }
}