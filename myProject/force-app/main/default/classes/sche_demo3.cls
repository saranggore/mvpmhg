public class sche_demo3 implements schedulable {
    public void execute(schedulableContext bc){
        opportunity opp=[select id from opportunity where name='triumph'];
        delete opp;
    }
}