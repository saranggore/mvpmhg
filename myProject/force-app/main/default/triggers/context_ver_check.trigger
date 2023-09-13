trigger context_ver_check on Account (before delete) {
    if(Trigger.isBefore){
        if(Trigger.isDelete){
            for(Account a: trigger.old){
                if(a.name=='Sujeet'){
                    a.addError('You cant delete this Account');
                }
            }
        }
    }
}