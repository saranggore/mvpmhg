public class SOqlopportunity {
    public List<opportunity> opps{set;get;}
    public SOqlopportunity(){
        
        opps=[select Account.Name,Amount,CloseDate,	Discount__c from opportunity where Amount>= 100000 order by Account.Name asc limit 15 ];
    }
}