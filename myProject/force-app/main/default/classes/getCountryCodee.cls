public class getCountryCodee {
@AuraEnabled
    public static map<string,string> getCountryCode(){
        map<String, String> countryCodeMap = new map<String, String>();
        for(Country_Codes__c ccm : [Select Country__c, Country_Code__c from Country_Codes__c Limit 3])
        {
        countryCodeMap.put( ccm.Country_Code__c,ccm.Country__c);
        }
    return countryCodeMap;
    }
}