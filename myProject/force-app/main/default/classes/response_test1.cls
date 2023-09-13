public class response_test1 implements HttpcalloutMock{
    public httpResponse respond(httpRequest request){
        system.assertEquals(request.getEndpoint(), 'https://www.capitalinfosol.com/create');
        system.assertEquals(request.getMethod(), 'GET');
        string jsonstring='{"LastName":"Myla","FirstNAme":"Satish","Phone":"1234"}';
        httpResponse response=new httpResponse();
        response.setBody(jsonstring);
        return response;
    }
}