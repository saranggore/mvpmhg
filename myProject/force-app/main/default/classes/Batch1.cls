global class Batch1 implements Database.Batchable <sobject> {
    global Database.QueryLocator start(Database.BatchableContext bc){
        string query='select ID,phone from account where createdDate=THIS_WEEK';
        return database.getQueryLocator(query);
    }
    global void execute(database.BatchableContext bc,List<Account> scope){
        for(account a:scope){
            
            a.rating='Hot';
        }
        update scope;
    }
    
    global void finish(database.BatchableContext bc){
        
    }
}