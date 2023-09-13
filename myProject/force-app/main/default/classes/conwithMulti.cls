public class conwithMulti {
    public list<Contact> demo{get;set;}
    public conwithMulti(){
        
         demo=[select Id,Name,Method__c from contact];
        //return demo;
    }
}