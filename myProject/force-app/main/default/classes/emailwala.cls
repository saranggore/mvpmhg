public class emailwala {
    public static void email1()
    {
        Messaging.SingleEmailMessage ems= new Messaging.SingleEmailMessage();
        string[] email=new string[]{'mayurgore3@gmail.com'};
        ems.setToAddresses(email);
        ems.setPlainTextBody('I am salesforce developer');
        ems.setSubject('Hello salesforce');
        Messaging.email[] emails= new Messaging.Email[]{ems};
        Messaging.sendEmail(emails);
        
    }
}