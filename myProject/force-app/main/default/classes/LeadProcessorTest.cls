@isTest
public class LeadProcessorTest {
     static testmethod void test(){
        List<lead> leads=new List<lead>();
        for(integer i=0;i<200;i++){
            lead asd=new lead();
            asd.FirstName='C N Rao';
            asd.LastName='Grafter';
            asd.Company='demo'+i;
            leads.add(asd);
        }
        insert leads;
    
 
        Test.startTest();
        LeadProcessor lpa=new LeadProcessor();
        Id batchId= Database.executeBatch(lpa);
        Test.stopTest();
        //system.assertEquals(200, [select count() from lead where leadSource='DreamForce']);
    }
}