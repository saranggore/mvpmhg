public with sharing class ContactController {
@AuraEnabled(cacheable=true)
public static List<contact>  getContacts(){
    throw new AuraHandledException('Forced error');
    //return [select FirstName,LastName,Email from contact];
}
   
}