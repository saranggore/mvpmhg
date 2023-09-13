public class soql3 {
   public list<Contact> contacts{set;get;}
   
    public soql3(){
        contacts=[select Email,Fax,Owner.Name ,Account.Name from contact ];
    }
}