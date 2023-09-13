trigger SFDC_Trigger_example_opportunityStage_based_on_Account2 on Account (before update) {
Map<ID,Account> accMap=new Map<Id,Account>([select id from account where id=:trigger.newmap.keyset()]);
    List<opportunity> stageClosed=new List<opportunity>();
    List<opportunity> stageClosedwon=new List<opportunity>();
    for(opportunity oppo:[select id,StageName,CreatedDate,Name from opportunity where accountId=:accMap.keySet()])
    {
        
        date startdate=oppo.CreatedDate.date();
        date enddate=system.today();
        integer diff=startdate.daysBetween(enddate);
        system.debug('--------------->'+diff);
        if(diff > 30)
        {
            oppo.StageName='Closed Lost';
            stageClosed.add(oppo);
            system.debug('>30 ----->Name'+oppo.Name);
        }
        else
        {
           system.debug('<30 ----->Name'+oppo.Name);
            oppo.StageName='Closed Won';
            stageClosedwon.add(oppo);
        }
    }
    //update stageClosed;
    //update stageClosedwon;
}