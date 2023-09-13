public class DynamicSoql {
	Public String oppName {set;get;}
	Public String oppStageName {set;get;}   
    Public List<Opportunity> opp{set;get;}   
    public List<SelectOption> options {get;set;}
    public String strSelected  {get;set;}
    public DynamicSoql(){
        opp=[select name from Opportunity];
    }
    public void dynamicSearch(){
        strSelected = '';
        String query ='select name,stageName from Opportunity';
                if(string.isNotBlank(oppName))
                {
                   query= query+' where name LIKE \'%'+ oppName +'%\'';
                }
        opp=Database.query(query);
        for(opportunity oo:opp)
        {
            options=new List<SelectOption>();	
            options.add(new SelectOption(oo.id,oo.Name));
        }
    }
}