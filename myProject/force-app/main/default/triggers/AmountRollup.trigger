trigger AmountRollup on Contact (after insert,after update,before delete) {
    AmountRollupHelper amount=new AmountRollupHelper();
     if((trigger.isInsert && trigger.isAfter) || (trigger.isAfter && trigger.isUpdate))
     {
         amount.rollUpInsert(trigger.new);
     }
     if(trigger.isBefore && trigger.isDelete)
     {
        amount.rollUpDelete(trigger.old);
     }
}