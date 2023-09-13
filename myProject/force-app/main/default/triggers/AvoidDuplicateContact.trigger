trigger AvoidDuplicateContact on Contact (before insert) {
    if(trigger.isBefore){
        if(trigger.isInsert){
            set<string> email=new set<string>();
            for(contact con:[select id,email from contact])
            {
                email.add(con.Email);
            }
            for(contact con1:trigger.new)
            {
                if(email.contains(con1.Email)){
                    con1.addError('This is duplicate contact');
                }
            }
        }
    }
}