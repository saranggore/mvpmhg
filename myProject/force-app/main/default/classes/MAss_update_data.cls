public class MAss_update_data {
    public List<account> accounts {get;set;}
    public MAss_update_data(Apexpages.StandardSetController controller){
        List<string> fields=new List<string>{'Name','Phone','Industry','Rating','ownership'};
            controller.addFields(fields);
        accounts=(List<account>)controller.getSelected();
        
    }
    
    public pagereference updateData(){
        for(account a:accounts){
            a.rating='Hot';
            a.ownership='Public';
            
        }
        update accounts;
        Pagereference p=new pagereference('/001/o');
        return p;
    }
}