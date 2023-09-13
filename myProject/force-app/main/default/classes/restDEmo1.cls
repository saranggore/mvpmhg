@RestResource (urlMapping='/demo1/*')
global class restDEmo1 {
@httpGet
    global static account dogetaccount(){
      
   
        RestRequest request=RestContext.request;
        //string accid = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        String accid = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Account a1=[select name,id from account where Id=:accid];
        return a1;
        
    }
}