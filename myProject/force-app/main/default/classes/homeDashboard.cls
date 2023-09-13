public class homeDashboard {
@AuraEnabled
    public static List<DSP__c> getdspName()
    {
        List<DSP__c> name=[select Id,Company_Name__c from DSP__c];
        return name;
    }
    public static List<DSP__c> getdspTask()
    {
        List<DSP__c> name=[select Id,Company_Name__c from DSP__c];
        return name;
    }
}