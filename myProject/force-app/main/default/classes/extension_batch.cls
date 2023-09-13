////invoking batch apex for required DML Operation
public class extension_batch {
    public extension_batch(apexpages.StandardController controller)
    {
        
    }
    ///show job id if batch operation is successful.
    public static void batchExample(){
        Id batchId=Database.executeBatch(new practice_Example_batch(), 2);
        if(batchId !=null)
        {
            Apexpages.addMessage(new ApexPages.message(apexpages.Severity.INFO,'Operation Successful: Batch jobId='+batchId));
        }
    }

}