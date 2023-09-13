public class email2 {
    public static void raisoni()
    {
        Messaging.SingleEmailMessage trail2=new Messaging.SingleEmailMessage();
        string[] sese=new string[]{'mayurgore3@gmail.com'};
        trail2.setToAddresses(sese);
        trail2.setSubject('Geography notes');
        trail2.setPlainTextBody('param1');
        Messaging.email[] mms=new Messaging.Email[]{trail2};
        Messaging.sendEmail(mms);
    }
}