global class sche_demo1 implements Schedulable {
 global void execute(SchedulableContext bc){
        opportunity opp=new opportunity();
        opp.name='VinayakGore';
        //opp.CloseDate=Today()+1;
        opp.StageName='Prospecting';
        insert opp;
    }
}