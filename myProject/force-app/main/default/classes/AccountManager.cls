@RestResource (urlMapping='/Accounts/*/contacts')
global class AccountManager {
@HttpGet
    global static account getAccount(){
        
        RestRequest request=RestContext.request;
        String accid = request.requestURI.substringBetween('Accounts/','/contacts');
      
       // Map<string,string> paramsMap=RestContext.request.params;
        //string accid=paramsMap.get('Id');
        Account acc=[select id,name,(select id,name from contacts) from account where id=:accid];
        return acc;
        
    }
}