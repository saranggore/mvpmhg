public class soql1 {
    public list<lead> leads{set;get;}
    public soql1(){
        leads=[select AnnualRevenue,Company,Fax,Industry from lead];
    }
}