public class soql2 {
list<Account> account=[select id,Name,phone from account where rating ='Hot'];
    list<opportunity> opplist=[Select id ,Name,Amount from opportunity where Accountid in:account];    
    
}