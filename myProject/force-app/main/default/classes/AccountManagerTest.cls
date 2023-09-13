@isTest
public class AccountManagerTest {
@isTest
    public  static void AccManagerTest(){
    Account demo1=new account(Name='jumbo');
        insert demo1;
        contact con1=new contact();
        con1.LastName='motu';
        con1.AccountId=demo1.Id;
        insert con1;
        Id recordId=demo1.Id;
    RestRequest request=new RestRequest();
        request.requestURI='https://mvpmgh-dev-ed.my.salesforce.com/services/apexrest/Accounts/'+recordId+'/contacts';
        request.httpMethod='GET';
        RestContext.request=request;
        Account tt=AccountManager.getAccount();
        
        system.assert(tt!=null);
        system.assertEquals('jumbo',tt.name);
}
}