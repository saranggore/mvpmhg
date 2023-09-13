global class fb_integration {
    public string id1                 {set;get;}
    public string name1               {set;get;}
    public string email               {set;get;}
    public string accesstoken         {set;get;}
    public map<string,object> result  {set;get;}
    public string res                 {set;get;}
    public string str                 {set;get;}
    public void invoke(){
        http p=new http();
        string url='https://graph.facebook.com/oauth/access_token?client_id=884733168708543';
        url=url+'&client_secret=19b3d4f06eaafaa61dd687eabcef2f1a';
        url=url+'&grant_type=client_credentials';
        httpRequest request=new httpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        httpResponse response=p.send(request);
        res=response.getBody();
        system.debug(res);
        system.JSONParser jp=JSON.createParser(res);
        while(jp.nextToken()!=Null){
            
            if(jp.getText()=='access_token'){
                
                jp.nextToken();
            accesstoken=jp.getText();
                system.debug(accesstoken);
            }
        }
    }
    public void fbpage(){
      
        http req=new http();
        httpRequest re=new httpRequest();
        string url='https://graph.facebook.com/10217740411884593?fields=id,name,email';
        url=url+'&access_token='+accesstoken;   
        system.debug(url);
        re.setEndpoint(url);
        re.setMethod('GET');
        httpResponse res=req.send(re);
        string str=res.getBody();
        system.debug(str);
        
        //JSON2APEX myclass=JSON2APEX.parse(str);
        //id1=myclass.id;
        //name1=myclass.name;
        //email=myclass.email;
        //system.debug(id1);
        //system.debug(name1);
        system.JSON.deserializeUntyped(str);
    }
}