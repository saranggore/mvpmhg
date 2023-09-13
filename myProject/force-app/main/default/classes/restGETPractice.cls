@RestResource(urlMapping='/ContactAPI/*')
global with sharing  class restGETPractice {
@HttpGet
    global static List<Contact> getContactIdandNames()
    {
        RestRequest contactRequest=RestContext.request;
        string contactRequestURI= contactRequest.requestURI;
        Integer contactLimit=Integer.valueOf(contactRequestURI.substring(contactRequestURI.lastIndexOf('/') + 1));
        List<Contact> contactList = [SELECT Id, Name FROM Contact LIMIT :contactLimit];
        // Returning the contacts in the response
        return contactList;
    }
@HttpPost
    global static contact createContact()
    {
        RestRequest contactRequest=RestContext.request;
        string requestBody=contactRequest.requestBody.toString();
        Contact contact=(Contact) JSON.deserialize(requestBody,Contact.class);
        insert contact;
        return contact;
    }    
    
}