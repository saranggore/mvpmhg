public class shareopportunity {
    public static void trig(List<opportunity> opty){
        user u=[select id from user where firstName='Sarang'];
        List<opportunityShare> share=new List<opportunityShare>();
        for(opportunity ops:opty)
        {
            if(ops.stageName=='Closed Won')
            {
                opportunityShare ody=new OpportunityShare();
                ody.opportunityId=ops.id;
                ody.opportunityAccesslevel='Read';
                ody.UserOrGroupId=u.id;
                ody.RowCause='Manual';
                share.add(ody);
            }
            
        }
        insert share;
    }
}