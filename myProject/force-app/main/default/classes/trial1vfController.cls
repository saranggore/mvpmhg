public class trial1vfController {
    public string name {get;set;}
    public void  demo1()
    {
        Account acc=new Account();
        acc.name=name;
        insert acc;
        show();
    }
    public pageReference show()
    {
        pageReference p=new pageReference('lightning/o/Account/');
        return p;
    }
}