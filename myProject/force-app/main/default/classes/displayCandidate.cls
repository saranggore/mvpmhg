public class displayCandidate {
    public List<Task_Details__c> candi {get;set;}
 
    public  displayCandidate()
    {
        candi=[SELECT Id, Name, Candidate_Id__r.Id,Candidate_Id__c, Candidate_Name__c, Task__c, DSP_ID__c FROM Task_Details__c];
    }
    
}