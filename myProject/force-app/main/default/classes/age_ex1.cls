public class age_ex1 {
@AuraEnabled
    public static string invke(string Name,string Rating,string Industry,string Phone){
        account acc=new account();
        acc.name=Name;
        acc.Rating=Rating;
        acc.Industry=Industry;
        acc.Phone=Phone;
        insert acc;
        string result=acc.Id;
        return result;
    }
}