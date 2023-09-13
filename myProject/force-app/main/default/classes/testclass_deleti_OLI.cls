@isTest
public class testclass_deleti_OLI {
    public static void callme(){
        
        List<OpportunityLineItem> mg =new List<OpportunityLineItem> ();
        OpportunityLineItem demo1=new OpportunityLineItem();
        demo1.Product2Id='01t2v00000BNg7CAAT';
        demo1.OpportunityId='0062v00001GjWLBAA3';
        demo1.Quantity=10;
        demo1.TotalPrice=1000;
        demo1.PricebookEntryId='01u2v00000CbhCjAAJ';
        mg.add(demo1);
        insert mg;
        delete mg;
    }
}