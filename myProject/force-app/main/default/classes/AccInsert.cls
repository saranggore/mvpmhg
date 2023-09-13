public class AccInsert {
    // Added comment for depository
    @AuraEnabled
    public static integer demo1(string acc1)
    {
        integer con=[select count() from contact where account.Name=:acc1];
        system.debug('con size='+con);
        system.debug('Acc is='+acc1);
        return con;
    }
}