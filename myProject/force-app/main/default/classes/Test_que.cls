@isTest
public class Test_que {
static testmethod void test1() {
        // startTest/stopTest block to force async processes 
        //   to run in the test.
        Test.startTest();       
        System.enqueueJob(new queue_ex());
        Test.stopTest();
        
       
           }
}