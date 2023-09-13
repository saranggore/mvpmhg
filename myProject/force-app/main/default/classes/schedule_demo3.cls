public class schedule_demo3 implements schedulable {
    public void execute(schedulableCOntext qc){
        List<opportunity> oppo=[select id from opportunity];
        system.debug('size of list'+oppo.size());
    }
}