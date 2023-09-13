@isTest
global class AnimalLocatorMock implements HttpCalloutMock {
    global httpresponse respond(httpRequest request){
        string body=('{"animal": {"id":1,"name":"tiger","eats":"dear","says":"grow"}}');
        Httpresponse response=new Httpresponse();
        response.setBody(body);
        response.setStatusCode(200);
        return response;
    }
}