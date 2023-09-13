/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-08-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class ShowWeather {
   @AuraEnabled(cacheable=true)
   public static string weatherDisplay(string cityName){
      
          Http http=new http();
          HttpRequest htrequest=new HttpRequest();
          htrequest.setEndpoint('callout:WeatherApi/current.json?q='+cityName);
          htrequest.setMethod('GET');

        HttpResponse res=http.send(htrequest);
        return res.getBody();
   }
}