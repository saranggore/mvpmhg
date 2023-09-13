public class linkedinconnect {
    public string clientid     {set;get;}
    public string clientsecret {set;get;}
    public string accesstoken  {set;get;}
    public string code         {set;get;}
    public string state        {set;get;}
    public string redirectUrl  {set;get;}
    public linkedinconnect(){
        redirectUrl='https://mvpmgh-dev-ed.my.salesforce.com/apex/LinkedinR'; 
    }
    public pageReference requestcode(){
        string url='https://www.linkedin.com/oauth/v2/authorization';
        url=url+'?response_type=code';
        url=url+'&client_id='+clientid;
        url=url+'&redirect_uri='+redirectUrl;
        url=url+'&state='+state;
        url=url+'&scope=r_basicprofile';
        pageReference p=new pageReference(url);
        return p;
    }
    
    
}