public class future1 {
@future
    public static void demo1(){
        Account acc=[select id from account limit 1];
        system.debug('Id is---->'+acc.id);
    }
}