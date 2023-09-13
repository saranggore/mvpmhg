global class bachable implements Database.Batchable<Sobject> {
    
        global Database.QueryLocator start(Database.BatchableContext sc)
        {
        string query='select Id,Name,StageName,CloseDate from opportunity where createdDate=Last_Month';
        return Database.getQueryLocator(query);
        }
    
        global void  execute(Database.BatchableContext sc,List<opportunity> opptyList)
        {
        for (opportunity op:opptyList)
        {
            op.stageName='Closed Won';
            op.closeDate=system.today();
        }
        }
    
    global void finish(Database.BatchableContext sc)
    {
        
    }
}