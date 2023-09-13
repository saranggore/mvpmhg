public class stagetrig {
    public static void tric(Map<Id,opportunity> oldMap,Map<Id,opportunity> newMap)
    {
        for(Id key :oldMap.keyset())
        {
            opportunity old=oldMap.get(key);
            opportunity newopt=newMap.get(key);
            if(old.stageName!='Closed won' && newopt.StageName=='Closed won')
            {
                newopt.CloseDate=System.today();
                
            }
        }
        
    }
}