public class returnOppo {

    @AuraEnabled
    public static string accid(string accName,string accIndust)
    {
        List<Account> acc=[select Id from account where Name=:accName and Industry=:accIndust];
        string accountId=acc[0].id;
        return accountId;
    }
    
    @AuraEnabled
    public static List<opportunity> oppList(string idacc)
    {
        List<opportunity> opp=[select Id,Name,StageName from opportunity where account.id=:idacc];
       
        return opp;
    }
}