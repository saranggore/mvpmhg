/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-05-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class passAccount {
    @AuraEnabled(cacheable=true)
    public static List<Account> showAccount(){

        return [select id,Name,Type from account limit 10];
    }
   
}