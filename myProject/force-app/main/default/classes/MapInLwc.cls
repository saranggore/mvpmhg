public with sharing class MapInLwc {

    @AuraEnabled
    public static map<string,string> showMap(){
        Map<string,string> oppMap= new map<string,string>();
       List<opportunity> oppList=[select Id,Name from opportunity limit 5];
       for(opportunity opp:oppList)
       {
        oppMap.put(opp.Id,opp.Name);
       }
       return oppMap;
    }
    
}