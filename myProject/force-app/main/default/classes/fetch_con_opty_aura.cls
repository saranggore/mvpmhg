public class fetch_con_opty_aura {
    @AuraEnabled
    public static string acccId(string aName,string aIndu)
    {
        string accID;
        List<Account> acc=[select Id,Name,Phone,Industry from account where Name=:aName and Industry=:aIndu];
        if(acc.size()== 0)
        {
         accId='Error' ;
            
        }
        else
        {
          accId=acc[0].id; 
        }
            return accId;
    }
    
    @AuraEnabled
    public static List<contact> conId(string accin)
    {
       List<contact> cons=[select Id,LastName,FirstName  from contact where accountId=:accin];
       return cons;
    }
    @AuraEnabled
    public static List<opportunity> oppId(string accindent)
    {
        List<opportunity> oppo=[select Id,name,stageName from opportunity where accountID=:accindent];
        return oppo;
    }
}