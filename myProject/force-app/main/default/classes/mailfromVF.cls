public class mailfromVF {
  public string subject{get;set;}
  public  string Body{get;set;}
       public void callme(){
    
    Messaging.SingleEmailMessage msg1= new Messaging.SingleEmailMessage();
    string[] mymail=new string[]{'mayurgore3@gmail.com'};
    msg1.setToAddresses(mymail);
    msg1.setSubject( subject );
    msg1.setPlainTextBody( Body );
    //list<Messaging.Email> message= new List<Messaging.Email>{msg1};
           Messaging.sendemail(new Messaging.SingleEmailMessage[]{msg1});   
    }
}