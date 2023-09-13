public class getAllContacts {
    @AuraEnabled
    public static List<contact> retContacts(){
        List<contact> conList=[select id,Name,Phone from contact limit 100];
        return conList;
    }
}