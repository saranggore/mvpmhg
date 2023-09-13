public class Account_oppo {
    
    Public Account acc       {get;set;}
    public opportunity oppo  {get;set;}
    public Account_oppo(ApexPages.StandardController controller){
        list<string> fields=new List<string>{'Name','Phone','Industry','Rating','ownership','Type'};
        controller.addFields(fields);
        acc=(Account)controller.getRecord();
        oppo=new opportunity();
    }
    
    public pagereference call(){
     oppo.AccountId=acc.Id;
        insert oppo;
    return new pagereference('/'+acc.id);        
    }
}