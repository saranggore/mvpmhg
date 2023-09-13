@isTest
public class tesst_quque_ex {
    @isTest
    static  void demo1(){
        Test.startTest();
        system.enqueueJob(new queue_ex());
        Test.stopTest();
        Account acct = [SELECT Name,Phone FROM Account WHERE Name='MayurGG' LIMIT 1];
        System.assertNotEquals(null, acct);
    }
}