public class Apex_Invocable_Method 
{
    @InvocableMethod
    public static void QuoteDelete(List<Id> OpportunityIds){
        List<Quote> name1 =[select id from quote
                          where Opportunity.id in :OpportunityIds
                          and Status != 'Accepted'];
        delete name1;
    }
}