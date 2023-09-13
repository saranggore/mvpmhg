public class CountryCodeHelper {
  public static string getCountryCode(String country) {
    Country_Code__mdt countryCode = [
      SELECT Id, MasterLabel, Country_Code__c
      FROM Country_Code__mdt
      WHERE MasterLabel = :country
      LIMIT 1
    ];
 
    return countryCode.Country_Code__c;
      
  }
   public static sobject getInstance(String country) {
       Country_Code__mdt mc = Country_Code__mdt.getInstance('Id');

          return mc;
   } 
}