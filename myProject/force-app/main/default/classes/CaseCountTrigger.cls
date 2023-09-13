public class CaseCountTrigger {
    Public static void demo1(List<case> records){
        
        List<Id> accID=new List<Id>();
        
        for(case caserec:records){
            accID.add(caserec.AccountId);
        }
        
        Map<string,List<case>> accMap=new Map<string,List<case>>();
        List<case> caseInfo=[select id from case where accountId=:accID and createdDate=Last_n_Days:7];
        for(case caserec:caseInfo)
        {
                 if(accMap.containsKey(caserec.accountId))
                {
                    List<Case> lstCont = accMap.get(caserec.accountId);
                    lstCont.add(caserec);
                    accMap.put(caserec.accountId,lstCont);
                }
                else
                {
                    List<Case> lstCont = new List<Case>();
                    lstCont.add(caserec);
                    accMap.put(caserec.accountId,lstCont);
                }
        }
        
        //check count for four cases in a week
        for(case case4check:records){
            List<case> accCase=accMap.get(case4check.AccountId);
            if(accCase.size()==4)
            {
                //send email for fourth case
            }
            
                accCase.clear();
            
        }
        
        //check case count three cases in a day
        List<case> caseThreeInfo=[select id from case where accountId=:accID and createdDate=Today];
        Map<string,List<case>> map3Case=new Map<string,List<case>>();
        for(case casetimes:caseThreeInfo){
            if(map3Case.containsKey(casetimes.accountId))
                {
                    List<Case> lstCont1 = map3Case.get(casetimes.accountId);
                    lstCont1.add(casetimes);
                    map3Case.put(casetimes.accountId,lstCont1);
                }
                else
                {
                    List<Case> lstCont1 = new List<Case>();
                    lstCont1.add(casetimes);
                    map3Case.put(casetimes.accountId,lstCont1);
                }
        }
        for(case case3CHeck:records){
            List<case> accCase=accMap.get(case3CHeck.AccountId);
            if(accCase.size()==3)
            {
                //send email for 3 cases in a day trigger
            }
           /* Date today = Date.today();
            Integer count=0;
            for(case case3:accCase)
            {
                if(case3.CreatedDate.date()==today)
                {
                    count+=1;
                }
            }
            if(count==3)
            {
                //send email fro 3 cases in a day
            }*/
            accCase.clear();
        }
    }
}