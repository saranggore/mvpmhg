global class bath_1 implements Database.Batchable<sobject>{
    global Database.Querylocator start(Database.BatchableContext bc){
      //  List<Account> query=[select name from account];
        return Database.getQueryLocator( 'select name from account');
    }
    
    global void execute(Database.BatchableContext bc,List<sobject> scope){
        Database.delete(scope,false);
    }
    global void finish(Database.BatchableContext bc){
        
    }
}