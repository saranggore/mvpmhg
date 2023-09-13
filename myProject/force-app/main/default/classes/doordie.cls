public class doordie {
    public Map<string,integer> accon {get;set;}
    public doordie()
    {
     
       Map<string,integer>  accon=new Map<string,integer>();
         List<Account> accList =  [Select Name , (Select  Name FROM Contacts) FROM Account ];
        for(Account acc : accLIst) {
             integer s=acc.contacts.size();
            accon.put(acc.Name,s);
            //system.debug('Number of contact='+s);
        }
    integer val=accon.get('Mayur V');
        system.debug(val);
    }
}