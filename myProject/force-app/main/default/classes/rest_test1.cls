public class rest_test1 {
    public void invoke(){
        http p=new http();
        httpRequest request=new httpRequest();
        request.setEndpoint('https://www.capitalinfosol.com/create');
        request.setMethod('GET');
        HttpResponse response=p.send(request);
        string jsonstring=response.getBody();
        System.JSONParser parse=JSON.createParser(jsonString);
        contact con=new contact();
        while(parse.nextToken()!=Null){
            if(parse.getText()=='LastName')
            {
                con.lastName=parse.getText();
            }
            
            if(parse.getText()=='FirstName')
            {
                con.FirstName=parse.getText();
            }
            
            if(parse.getText()=='Phone')
            {
                con.Phone=parse.getText();
            }
            
        }
    }
}