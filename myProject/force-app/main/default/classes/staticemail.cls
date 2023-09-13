public class staticemail
{
    public static void sendemail()
    {
        Messaging.SingleEmailMessage herry= new Messaging.SingleEmailMessage();
        {
           //Document desk=[select Name,id from Documnet where Name='Ursa Major Solar Logo'];
           Document doc=[select Name,id from Document where Name='Ursa Major Solar Logo']; 
            List<string> dada = new List<string>{'mayurgore3@gmail.com'};
            herry.setToAddresses(dada);
            herry.setEntityAttachments(new id[]{doc.id});
            herry.setSubject('King of persia');
            herry.setPlainTextBody('Hindi vs english');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[]{herry});
        }
    }
}