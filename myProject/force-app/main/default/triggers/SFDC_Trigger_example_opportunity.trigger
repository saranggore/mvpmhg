trigger SFDC_Trigger_example_opportunity on Opportunity (after insert) {
LIst<OpportunityLineItem> OLI=NEW List<OpportunityLineItem>();
    for(opportunity oppo:trigger.new)
    {
        OpportunityLineItem ol=new OpportunityLineItem();
        ol.OpportunityId=oppo.Id;
        ol.PricebookEntryId='01u2v00000DIJZUAA5';
        ol.Product2Id='01t2v00000CfHR5AAN';
        ol.Quantity=1;
        ol.TotalPrice=22;
        OLI.add(Ol);
    }
    insert OLI;
}