public class insertoperation {
 public static void opinsert(){
     try{
     Account acc=new Account();
     acc.AccountNumber='12345';
         insert acc;
         }
     catch(Exception e){
         system.debug('Hello World');
         
     }
    }
}