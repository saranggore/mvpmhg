global class approvalRecall {

    webservice static void recallApproval(Id recId)   
    {       
        List<ProcessInstanceWorkitem> piwi = [SELECT Id, ProcessInstanceId, ProcessInstance.TargetObjectId FROM ProcessInstanceWorkitem WHERE ProcessInstance.TargetObjectId =: recId];
       // Approval.ProcessWorkitemRequest req = new Approval.ProcessWorkitemRequest();
        //req.setAction('Removed');       
        //req.setWorkitemId(recId);
        opportunity opp=new opportunity();
        opp.Id=recId;
        opp.Recall_Approval__c=True;
        update opp;
        Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
        req1.setObjectId(recId);
        
        Approval.process(req1,false);
        
    }
}