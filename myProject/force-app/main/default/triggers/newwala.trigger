trigger newwala on OpportunityContactRole (before insert,before update) 
{
    List<opportunity> ooo=[select id,Name from opportunity ];
list<OpportunityContactRole> acc=[select contact.Name,contact.id,role from OpportunityContactRole where opportunityId=:ooo];
    
    for(OpportunityContactRole oppo:Trigger.new)
    {
        for(OpportunityContactRole acd:acc)
        {
       //    system.debug(oppo.contact.Name);
           system.debug(acd.contact.Name);
            
            if(oppo.Role==acd.Role && oppo.contact.Name==acd.contact.Name)
            {
                oppo.adderror('This is duplicate contact role');
                system.debug(oppo.contact.Name);
            }
        }
    }

}