trigger NameConcatenation on OpportunityLineItem (after insert,before delete) {
    if(trigger.isAfter && trigger.isInsert){
        set<Id> oId=new set<Id>();
        Map<Id,string> oppMap=new Map<Id,String>();
        List<opportunity> opUpdate=new list<opportunity>();
        //fetch opportunity Id
        for(OpportunityLineItem OLI:trigger.new){
            oId.add(OLI.OpportunityId);
        }
        //String concatenation
        for(OpportunityLineItem oLineItemProd:[select id,OpportunityId,ProductCode from OpportunityLineItem where OpportunityId IN :oId]){
          
            string pccode=oppMap.get(oLineItemProd.OpportunityId);
            if(pccode==null){
                oppMap.put(oLineItemProd.OpportunityId,oLineItemProd.ProductCode);
            }
            else{
                string prevValu=oppMap.get(oLineItemProd.OpportunityId);
                string newValue=prevValu+'  '+oLineItemProd.ProductCode;
                oppMap.put(oLineItemProd.OpportunityId,newValue);
            }
        }
        //update opportunity
        for(Id opp:oppMap.keyset()){
            opportunity oppo=new opportunity();
            oppo.Id=opp;
            oppo.relatedProducts__c=oppMap.get(opp);
            opUpdate.add(oppo);
        }
    update opUpdate;
    }
    if(trigger.isBefore && trigger.IsDelete){
         Map<Id,string> opporId=new Map<Id,string>();
        List<opportunity> opupdate=new List<opportunity>();
        for(opportunityLineItem oli1:trigger.old){
            opporId.Put(oli1.OpportunityId,oli1.ProductCode);
        }
        for(opportunity oppfetch:[select id,relatedProducts__c from opportunity where Id IN :opporId.keyset()]){
            string presetValue=oppfetch.relatedProducts__c;
            string removeValue=opporId.get(oppfetch.id);
            string finalval = presetValue.replace(removeValue,'');
            //opportunity oppip=new opportunity();
            //oppip.id=oppfetch.id;
            oppfetch.relatedProducts__c=finalval;
            opupdate.add(oppfetch);
        }
        update opupdate;
    }
}