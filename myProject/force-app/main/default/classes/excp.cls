public class excp {
    public static void excp1(){
        try{
Account acc=new account();
    insert acc;
        }
        catch(exception e){
            system.debug('error is'+e.getMessage());
        }
}
}