////batch apex practice example
global class practice_Example_batch implements Database.Batchable<sobject>
{
    ///batch apex start method to fetch account records
    global Database.QueryLocator start(DAtabase.BatchableContext bc)
    {
        return Database.getQueryLocator('select Id,Name from account');
    }
    
    ///perform Dml operation to update account Name
    global void execute(Database.BatchableContext bc,List<Account> scope)
    {
        for(Account acc:scope)
        {
            acc.name='Dr'+acc.Name;
            update acc;
        }
    }
    ///post  execute opeation in batch apex
    global void finish(Database.BatchableContext bc){
        
    }
}