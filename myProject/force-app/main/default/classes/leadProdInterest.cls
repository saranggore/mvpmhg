public class leadProdInterest {
    public  void demo(List<Lead>newList){
        
        for(lead lds:newList){
            if(lds.Product_Interest__c!=null){
            List<string> selections =lds.Product_Interest__c.split(';');
            if(selections.contains('EXCEED') && (selections.contains('WARRANTY') ||selections.contains('CONSUMABLES')))
            {
                system.debug('EXCEED + WARRENTY/CONSUMABLES');
            }
            if(selections.contains('EXCEED') && (selections.contains('WARRANTY') ||selections.contains('CONSUMABLES')) && selections.size()>2)
            {
                  if(selections.contains('EXCEED') && (selections.contains('WARRANTY') && selections.contains('CONSUMABLES')))
                  {
                      system.debug('EXCEED + WARRENTY/CONSUMABLES');
                  }
                else
                {
                    system.debug('EXCEED + WARRENTY/CONSUMABLES + System');
                }
                
            }
            else
            {
                system.debug('EXCEED + SYSTEMS');
            }
            }}
    }
}