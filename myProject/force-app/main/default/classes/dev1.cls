public class dev1 {
    public list<Contact> contacts {set;get;}
    public dev1(){
        
        contacts = [select Fax,Email,Phone,Name from Contact];
    }
}