////Q1 : Adding Name prefix to account Name.
global class Test_batch  implements Database.Batchable<sobject>
{
    ///batch apex start method to fetch account records
    global Database.QueryLocator start(DAtabase.BatchableContext bc)
    {
        return Database.getQueryLocator('select Id,Name from account');
    }
    
    ///Add prefix 'IQ' to account name and update account using DML operation
    global void execute(Database.BatchableContext bc,List<Account> scope)
    {
        for(Account acc:scope)
        {
            //If account name already has IQ prefix then dont update account name
            if(acc.Name.contains('Iq'))
            {
             continue;
            } 
            else
            {
             acc.name='IQ '+acc.Name;
             update acc; 
            }
        }
    }
    ///post  execute opeation in batch apex
    global void finish(Database.BatchableContext bc){
        
    }
}