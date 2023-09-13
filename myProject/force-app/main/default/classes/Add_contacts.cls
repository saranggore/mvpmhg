public class Add_contacts {
    public List<contact> contacts {get;set;}
    
    public Add_contacts(){
        contacts=new List<contact>();
        addContact();
    }
    public void addContact(){
      contact c=new contact();
        contacts.add(c);
    }
    
    public pagereference create(){
        pagereference r;
        insert contacts;
        r=new Pagereference('/003/o');
        return r;
        
    }
 
}