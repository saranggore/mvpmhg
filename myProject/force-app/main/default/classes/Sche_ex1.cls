public class Sche_ex1 implements schedulable {
    public void execute(schedulableContext bc){
        account acc=[select name from account][0];
        delete acc;
    }
}