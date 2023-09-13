public class Account_save_controller {
    public account acc{set;get;}
    public contact con{set;get;}
    public Account_save_controller(ApexPages.StandardController controller){
        list<string> fields=new List<string>{'Name','Phone','Industry','Rating','ownership','Type'};
        controller.addFields(fields);
        acc=(Account)controller.getRecord();
        con=new contact();
    }
    public pageReference saveMe(){
        update acc;
        con.accountId=acc.Id;
        insert con;
        return new pagereference('/'+acc.Id);
    }
}