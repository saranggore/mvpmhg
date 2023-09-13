@isTest
global class test_restDemo1 {
@isTest
    global static void demo1(){
        Account gemo=new Account(Name='Sara');
            insert gemo;
        id recordId=gemo.Id;
        RestRequest request=new RestRequest();
        request.requestURI='https://mvpmgh-dev-ed.my.salesforce.com/services/apexrest/demo1/'+recordId;
        request.httpMethod='GET';
        RestContext.request=request;
        Account acc=restDEmo1.dogetaccount();
        system.assert(acc!=null);
        system.assertEquals('Sara',acc.Name);
        
    }
}