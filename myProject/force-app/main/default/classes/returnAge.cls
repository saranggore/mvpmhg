public class returnAge {
    
@AuraEnabled
    public static string reAge(string name,string phone,string rating,string industry ){
        string result;
        Account acc=new Account();
        acc.Name=name;
        acc.Phone=phone;
        acc.Rating=rating;
        acc.Industry=industry;
       
        insert acc;
        result=acc.id;
        return result;
     
    }
}