public class searchVfpage {
 public String text {get;set;}
 public Map<string,string> searched  {get;set;}
    List<opportunity> kare {get;set;}

   public string text()
   {
    system.debug('+'+text);
       return text;
   }
    Public void dosearch(){
        searched=new Map<string,string>();
        //string  query='select email__c,phone__c,name from opportunity where email__c  like\''+ '%'+text+'%\' ';
        //List<opportunity> kare= database.query(query);
       kare=(List<opportunity>)[FIND :text RETURNING opportunity(email__c, phone__c,name)][0];

       for (opportunity oppo:kare){
        searched.put(oppo.email__c, oppo.name);}
       
    }
     
}