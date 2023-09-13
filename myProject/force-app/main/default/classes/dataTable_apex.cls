public class dataTable_apex {
    
@AuraEnabled
    public static List<opportunity> Demo1(){
        List<opportunity> con=[select Name,stageName,closeDate from opportunity];
        return con;
    }
}