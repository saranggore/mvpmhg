public class classic {
    public static void jumbp()
    {
        List<Account> acc=[select Id,Name from account where Name like 'A% and not [%Z]'];
        delete acc;
    }
}