public class sche_demo2 implements schedulable{
    public void execute(SchedulableCOntext bc){
        opportunity opp=[select id,name from opportunity where name='triumph'];
        opp.StageName=	'Closed Won';
        update opp;
    }
}