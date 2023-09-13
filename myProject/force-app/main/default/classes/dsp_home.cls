public class dsp_home {
@AuraEnabled
    public static List<DSP__c> demo1(string dspName){
        return [select Id,Name from DSP__c where Name=:dspName];
    }
@AuraEnabled
    public static List<Tasks__c> demo2(string taskName){
        return [select Id,Name from Tasks__c where DSP_Id__c =:taskName];
    }
@AuraEnabled
    public static List<Task_Details__c> demo3(string candiName){
        return [SELECT Id, Candidate_Id__c, Candidate_Name__c, Task__c, DSP_ID__c, Email__c,Status__c, Sub_Status__c  FROM Task_Details__c where Name =:candiName];
    }    
}