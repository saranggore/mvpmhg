public class stay_in_touch {
    public account acc{get;set;}
    public List<contact> contacts{get;set;}
    public stay_in_touch(Apexpages.StandardController controller){
        List<string> fields=new List<string>{'Name','Phone' };
        controller.addFields(fields);   
    acc=(account)controller.getRecord();
        contacts=[select Id,Name,Phone,Email,LastName from contact where AccountId =:acc.Id];
    }
    
    public Pagereference callMe(){
        
        List<Messaging.SingleEmailMessage> emails= new List<Messaging.SingleEmailMessage>();
        for(contact co:contacts){
           Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
            string[] ema=new string[]{co.Email};
            msg.setToAddresses(ema);
            msg.setSubject('Update contact Details');
            string body='Dear'+co.Name+',<br/>current Details are<br/>';
            body=body+'<b>Email:</b><i>'+co.Email+'</i><br/>';
            body=body+'<b>Phone:</b><i>'+co.Phone+'</i><br/>';
            body=body+'<b>Update the details in case  of any modification';
            msg.setHtmlBody(body);
            emails.add(msg);
            
        }
        Messaging.sendEmail(emails);
        pagereference p=new pagereference ('/'+acc.Id);
        return p;
    }
}