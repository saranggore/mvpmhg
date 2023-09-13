public class callFromFLow {
@InvocableMethod
    public  static void recallApproval(List<Id> OpportunityIds)   
    {       
        string recId=OpportunityIds[0];
        List<ProcessInstanceWorkitem> piwi = [SELECT Id, ProcessInstanceId, ProcessInstance.TargetObjectId FROM ProcessInstanceWorkitem WHERE ProcessInstance.TargetObjectId =: recId];
        opportunity opp=new opportunity();
        opp.Id=recId;
        opp.Recall_Approval__c=True;
        update opp;
        Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
        req1.setObjectId(recId);
        
        Approval.process(req1,false);
        
    }
}