public class FeedItemTriggerHandler {
    public  static void countFeedItem(){ 
        List<feeditem__c> lstFeed=[select Name,type__c,case__c from feeditem__c];
        set<id> relatedCasesIds = new set<id>();
        for(FeedItem__c fd : lstFeed) {
            if (fd.type__c =='TextPost')
            {
                relatedCasesIds.add(fd.case__c);
            }
        }
        Map<Id, case> relatedCases = new Map<Id, case> ([Select id, caseNumber,	All_Users_Feed_Count__c FROM case where id in: relatedCasesIds]);
        List<case> casesToUpdate = new List<case>(); 

        integer count = 0;
        for(case c:relatedCases.values()) {
           for(FeedItem__c fd : lstFeed) {
               if (fd.type__c =='TextPost' &&  fd.case__c == c.id) {
                   count=count+1;
 
                   
            system.debug('c.All_Users_Feed_Count__c');
               } 
             } 
           c.All_Users_Feed_Count__c = count;
           count = 0;
            casesToUpdate.add(c);
          update casesToUpdate;
        }
         
    }
}