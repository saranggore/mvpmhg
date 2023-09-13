public class summary2 {
 @AuraEnabled(cacheable=true)
 public static List<Integer> runReport()
    {
        Report rep=[SELECT Id,DeveloperName FROM Report where DeveloperName = 'SummaryCount'];
        Reports.reportResults results = Reports.ReportManager.runReport(rep.Id, true);
        Reports.Dimension dim = results.getGroupingsDown();
        system.debug(dim);
        List<Reports.GroupingValue> groupingVal = dim.getGroupings();
        system.debug('size----->'+groupingVal);
         List<string> rowCOunt=new List<string>();
         List<Integer> showCount =new List<Integer>(); 
        for(Reports.GroupingValue aa:groupingVal)
        {
                String factMapKey =aa.getKey() + '!T';
                // Get the fact map from the report results
                Reports.ReportFactWithDetails factDetails =
                (Reports.ReportFactWithDetails)results.getFactMap().get(factMapKey);
                //system.debug(factDetails); 
                Reports.SummaryValue sumVal = factDetails.getAggregates()[0];
                System.debug('Summary Value: ' + sumVal.getLabel());
                rowCOunt.add(sumVal.getLabel());
        } 
        system.debug('rowCOunt----->'+rowCOunt);
        string lastMonthCount=rowCOunt.get(rowCOunt.size()-1);
        system.debug('Last Month Count----->'+lastMonthCount);
        integer first=0;
        for(string sum:rowCOunt){
            first=first+Integer.valueof(sum);
        }
        system.debug('Year count---->'+first);
        showCount.add(first);
        showCount.add(Integer.valueof(lastMonthCount));
        system.debug('showCount---->'+showCount);
        return showCount;
      }
    
     public static  List<string> runReport2()
    {
        Report rep1=[SELECT Id,DeveloperName FROM Report where DeveloperName = 'opportunityCount'];
        Reports.reportResults resultss = Reports.ReportManager.runReport(rep1.Id, true);
        Reports.Dimension dimm = resultss.getGroupingsAcross();
        system.debug(dimm);
        List<Reports.GroupingValue> groupingVall = dimm.getGroupings();
        system.debug('size----->'+groupingVall);
         List<string> rowCOuntt=new List<string>();
        for(Reports.GroupingValue aa:groupingVall)
        {
            
            rowCOuntt.add(aa.getLabel());
        }
        return rowCOuntt;
    }
      @AuraEnabled(cacheable=true)
    public static  string runReport3()
     {
         Report rep=[SELECT Id,DeveloperName FROM Report where DeveloperName = 'SummaryCount'];
         
         return rep.id;
     }
}