public class daattable_practice {
@AuraEnabled
    public static List<Account>  demo2(){
        return[select Id,Name,Phone from account limit 10];
    }
}