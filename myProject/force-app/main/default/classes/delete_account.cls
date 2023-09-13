public class delete_account {
    public List<account> accounts {set;get;}
    public delete_account(apexpages.StandardSetController controller){
        List<string> fields=new list<string>{'Name','Phone','Industry'}  ;
        controller.addFields(fields);
        accounts=(List<Account>)controller.getSelected();
    }
    
    public pagereference callME(){
        
        delete accounts;
        return null;
    }
}