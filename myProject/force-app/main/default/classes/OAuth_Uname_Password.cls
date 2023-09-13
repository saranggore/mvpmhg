public class OAuth_Uname_Password {
    public string endpoint        {set;get;}
    public string clientId        {set;get;}
    public string clientsecret    {set;get;}
    public string username        {set;get;}
    public string password        {set;get;}
    public string accesstoken     {set;get;}
    public string result          {set;get;}
    public string industry        {set;get;}
    public string Department        {set;get;}
    public List<string> names     {set;get;}
    public OAuth_Uname_Password(){
      endpoint='https://login.salesforce.com/services/oauth2/token';
    }
    public void send(){
        http p=new http();
        httpRequest request=new httpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('POST');
        string body='grant_type= password';
        body=body+'&client_id='+clientId;
        body=body+'&client_secret='+clientsecret;
        body=body+'&username='+username;
        body=body+'&password='+password;
        request.setBody(body);
        HttpResponse response=p.send(request);
        result=response.getBody();
        
        system.JSONParser jp=JSON.createParser(result);
        while(jp.nextToken()!=Null){
            
            if(jp.getText()=='access_token'){
                
                jp.nextToken();
            accesstoken=jp.getText();
            }
        }
    }

    public void invoke(){
        string endpoint='https://mvgindustries-dev-ed.my.salesforce.com/services/apexrest/mg/?Department='+Department;
        http p=new http();
        httpRequest request=new httpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        request.setHeader('Authorization','OAuth '+accesstoken);
        httpResponse response=p.send(request);
        result=response.getBody();
        system.JSONParser jp=JSON.createParser(result);
        while(jp.nextToken()!=Null){
            if(jp.getText()=='Contacts'){
                jp.nextToken();
            names=(List<string>)jp.readValueAs(LISt<string>.class);
            }
        }
    }
}