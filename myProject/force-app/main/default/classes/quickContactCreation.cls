public class quickContactCreation {
@AuraEnabled
    public static string createcontact(contact con){
        insert con;
        return con.Id;
        
    }
}