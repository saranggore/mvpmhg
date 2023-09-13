public class contactListController {
@AuraEnabled
    public static List<Contact> getContactList(){
        List<contact> contactList=[select Id,FirstName,LastName,Email,Phone from contact];
        return contactList;
    }
}