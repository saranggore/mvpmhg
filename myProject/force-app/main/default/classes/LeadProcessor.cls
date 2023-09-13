global class LeadProcessor implements Database.batchable<sobject>{
    global Database.querylocator start(database.BatchableContext bc){
    // string gc='select id,leadSource from lead';
        return database.getQueryLocator([select leadSource from lead]);
    }
    
    global void  execute(database.BatchableContext bc,List<lead> Scope){
       for(lead leads:Scope){
            leads.leadSource='DreamForce';
          }
           update scope;
    }
    
    global void finish(database.batchablecontext bc){
        system.debug('Hello');
    }
}