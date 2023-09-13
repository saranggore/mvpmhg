global class batch_example implements Database.Batchable<sObject> {
    global Database.QueryLocator start(database.BatchableContext bc){
        string query='select id from account limit 1';
            return database.getQueryLocator(query);
    }
    global void execute(database.BatchableContext bc,List<sobject>scope){}
    global void finish(database.BatchableContext bc){}
}