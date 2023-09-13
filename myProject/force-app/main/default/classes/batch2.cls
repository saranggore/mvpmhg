global class batch2 implements database.Batchable<sobject> {
global database.QueryLocator start(database.BatchableContext bc){
    string query='select id,name,stageName from opportunity ' ;
    return database.getQueryLocator(query);
    }
    
    global void execute(database.BatchableContext bc,List<opportunity> scope){
        for(opportunity oppo:scope){
            If(oppo.stageName=='closed won'){
            oppo.stageName='Prospecting';
            }
        }
        update scope;
    }
    global void finish(database.BatchableContext bc){
        Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
        msg.setToAddresses(new string[]{'saranggore9@gmail.com'});
        msg.setSubject('Haram ka khana mana he');
        msg.setPlainTextBody('J1 zala ka?');
        Messaging.Email[] demo=new Messaging.Email[]{msg};
        Messaging.sendEmail(demo);
    }
}