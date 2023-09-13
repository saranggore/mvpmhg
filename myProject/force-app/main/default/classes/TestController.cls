////Apex class Test Exam
public class TestController
{
    public TestController(apexPages.StandardController controller)
    {
        
    }
    
    ///Q.1Add prefix IQ to all account name using asynchronous batch apex
    public static void accountBatch()
    {
        Id batchJobId=Database.executeBatch(new Test_batch(), 2);
    }
    
    ///Q2.SOQL query on account object
    public static void accountSoql()
    {
        // Fetch account which start witn 'A' and does not end with 'Z'
        List<Account> acc=[Select Id,Name from account where (Name like 'A%') And (Not(Name like '%z'))];
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Accounts with  name starts with A and does not End with Z --->'+JSON.serialize(acc)));
        
        //fetch accounts which contain 'IQ' substring
        List<Account> acc1=[Select Id,Name from Account where Name like '%IQ%'];
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Accounts which contain IQ substring --->'+JSON.serialize(acc1)));
    
        //fetch accounts whose Name starts with 'IQ' substring
        List<Account> acc2=[Select Id,Name from Account where Name like 'IQ%'];
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Accounts whose Name starts wit IQ substring --->'+JSON.serialize(acc2)));
        
        //fetch accounts whose Name contains exactly 7 characters
        List<Account> acc3=[Select Id,Name from Account where Name like '_______'];
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Accounts which containExact 7 letters --->'+JSON.serialize(acc3)));

        //fetch account with numeric name
        List<Account> acc8=[SELECT Id,Name FROM Account WHERE Name <'a'];
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Numeric Account records  --->'+JSON.serialize(acc8)));
   
        
        //fetch 10 accounts records excluding first 10
        List<Account> acc4=[Select Id,Name from Account limit 10 offset 10];
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'10 Account records  --->'+JSON.serialize(acc4)));
        
    }
    
    ///Q3 :print the output
    public static void ansPrint()
    {
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Answer---->  a'));
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Break keyword use---->If we use break keyword in the loop then toop terminates and execution goes outside loop'));
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Continue Keyword use---->Using continue keyword we can terminate iteration and move to next iteraton in same loop'));
    }
    
    ///Q4a:Write an infinite loop
    public static void infLoop()
    {

        List <account> aaco=[select Id,Name from Account];
        //infinite loop by not mentioning limit
        for(integer i=0;;i++)
        {
              // system.debug('Account'+aaco[i]); 
        }
    }
    
    ///Q4b:Iterate through all account object using for loop.
    public static void Loop2()
    {

        List <account> aaco2=[select Id,Name from Account];
        for(Account acc:aaco2)
        {
           system.debug('Account'+acc.Name); 
        }
    }
    
    ///Q5 a: Soql rows  governor limit
    public static void stateLimitSoql()
    {
       for(integer i=1;i<=110;i++)
           {
             //SOQL query can't fetch more than 50K records 
               List<Account> acc=[select Id from Account];
           }    
    }
    
    ///Q5 b:SOQL sattement Governing limits 
    public static void soqlStatementgovLimits()
    {
        //code to hit SOQL statement goveror limit as SOQL governor limit for synchronous SOQL is 100
         for(integer i=1;i<=101;i++)
           {
               List<Account> accountG=[select Id from account limit 10];
           }  
    }
    
    ///Q5 d:DML Rows limit exception
    public static void dmlRowsGL()
    {
       List<Account> account=new List<Account>();
        //Cant perform DML operation on more than 10k records: DML rows limit exception
        for(integer i=1;i<=10001;i++)
        {
           Account acc=new Account();
            acc.Name='acci';
             account.add(acc);
        }
       insert account;
    } 
    
    ///Q5.d DML statement limit governor limit
    public static void dmlException()
    {
        //governor limit for DML statement is 150 
        List<Account> accounts=[Select Id,Name from account];
        for(Account acc:accounts)
        {
            acc.name='demo1';
            update acc;
        }
    }
    
  
    
    ///Q6.a Insert 20 account records using series ACC001 to ACC020 
    public static void accInsert()
    {
        for(integer i=1;i<=20;i++)
        {
            sObject recordds = Schema.getGlobalDescribe().get('Account').newSObject() ;
            //logic for ACC001-ACC009
            if(i<10)
            {
              recordds.put('Name','Acc00'+i) ;
             
            }
             //logic for ACC010-ACC020
            else
            {
               recordds.put('Name','Acc0'+i) ;
            }
            insert recordds;
        }
    }
    
    ///Q6.b.Delete account records Name Contains “IQ-“
    public static void delAccount()
    {
        //create list of accounts to delete records
        List<Account> accounts=new List<Account>();
        for(Account acc:[select Id,Name from Account])
        {
            //if account name contains IQ then add account to list accounts
            if(acc.Name.contains('IQ'))
            {
                accounts.add(acc);
            }
        }
        delete accounts;
    }
}