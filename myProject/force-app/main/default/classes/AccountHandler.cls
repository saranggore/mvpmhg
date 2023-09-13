public class AccountHandler {
public static Account insertNewAccount(string mayu)
{
    Account demo=new account();
    demo.Name= mayu;
    try{
        insert demo;
        return demo;
    }
    catch(exception ee){
        return null;
    }
}
}