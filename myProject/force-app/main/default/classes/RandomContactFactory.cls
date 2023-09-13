public class RandomContactFactory {
    public static list<contact> generateRandomContacts(integer NumberOfContacts,string lastName){
        List<contact> cc=new List<contact>();
        
        for(integer i=1;i<=NumberOfContacts;i++)
        {
            contact c=new contact();
            c.FirstName='Test'+i;
            cc.add(c);
            
        }
        system.debug(cc);
        return cc;
    }
}