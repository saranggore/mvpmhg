public class drerere {
    public string searchtext {get;set;}
    Public List<Account> acc {get;set;}
    public void callMe(){
        acc=[select Name,Phone,Industry,Rating from account where Rating=:searchtext or Name=:searchtext or Industry=:searchtext];
        
    }
}