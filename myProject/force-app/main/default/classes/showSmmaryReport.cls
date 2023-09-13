public class showSmmaryReport 
{
    public static void runReport()
    {
        Report rep=[SELECT Id,DeveloperName FROM Report where DeveloperName = 'opportunityCount'];
        Reports.reportResults results = Reports.ReportManager.runReport(rep.Id, true);
        Reports.Dimension dim = results.getGroupingsAcross();
        system.debug(dim);
        List<Reports.GroupingValue> groupingVal = dim.getGroupings();
        system.debug('size----->'+groupingVal);
        for(Reports.GroupingValue aa:groupingVal)
        {
            
                List<string> rowCOunt=new List<string>();
                //Map<String,String> resul=new Map<String,String>();
                String factMapKey = 'T!' + aa.getKey()  ;
                    // Get the fact map from the report results
                Reports.ReportFactWithDetails factDetails =
                (Reports.ReportFactWithDetails)results.getFactMap().get(factMapKey);
                system.debug(factDetails); 
                Reports.SummaryValue sumVal = factDetails.getAggregates()[0];
                System.debug('Summary Value: ' + sumVal.getLabel());
                rowCOunt.add(sumVal.getLabel());
                //resul.put(aa.getLabel(),sumVal.getLabel());
             // }
             //break;
        }
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
}