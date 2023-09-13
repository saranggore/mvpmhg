public class leasebulding {
    public string name            {get;set;}
    public string name1           {get;set;}
    public list<Flat__c> listflat {get;set;}
   
    public void leasebulding(){
       listflat=new list<Flat__c>();       
    }
    public void addnumber(){
       Flat__c aa=new Flat__c();
        aa.name=name1;
        aa.BuildingName__c=name;
        insert aa;
     
    }
    
}