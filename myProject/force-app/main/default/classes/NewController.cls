public class NewController {

    public Map<Id ,List< Contact>> mapToshowContactCount{get;set;}
    
    public NewController() {
        
        mapToshowContactCount = new Map<Id , List< Contact>>();
        List<Account> accList =  [Select Id , (Select  Name FROM Contacts) FROM Account ];
        for(Account acc : accLIst) {
            
            for(Contact con : acc.Contacts) {
                if(!mapToshowContactCount.containsKey(acc.Id)) {
                    mapToshowContactCount.put(acc.Id, new List<Contact>{con});
                }
                else {
                    mapToshowContactCount.get(acc.Id).add(con);
                }
            }
            
        }
        System.debug(mapToshowContactCount);
    }
}