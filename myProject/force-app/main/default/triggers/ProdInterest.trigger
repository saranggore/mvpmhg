trigger ProdInterest on Lead (before insert,after insert) {
leadProdInterest handlerLead= new leadProdInterest();
    if(trigger.isInsert && trigger.IsAfter){
        handlerLead.demo(trigger.new);
    }
}