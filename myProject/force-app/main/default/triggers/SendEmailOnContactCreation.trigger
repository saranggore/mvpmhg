trigger SendEmailOnContactCreation on Contact (before insert) {
    if(trigger.isbefore){
        if(trigger.isinsert){
            List<Messaging.SingleEmailMessage> mails=new List<Messaging.SingleEmailMessage>();
            for(Contact con:trigger.new)
            {
                if(con.Email != null && con.FirstName != null)
                {
                     Messaging.SingleEmailMessage mail =new Messaging.SingleEmailMessage();
                        List<string> sendTo=new List<string>();
                        sendTo.add(con.Email);
                        mail.setToAddresses(sendTo);
                        mail.setReplyTo('saranggore9@gmail.com');
                        mail.setSenderDisplayName('Mayur Gore');
                        mail.setSubject('Contact Creation Email');
                        mail.setHtmlBody('Welcome to New Org.');
                        mails.add(mail);
                    }
                    messaging.sendEmail(mails);
                }
        }
    }
}