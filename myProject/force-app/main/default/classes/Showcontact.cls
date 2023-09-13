/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-05-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class Showcontact {
   @AuraEnabled(cacheable=true)
   public static List<contact> show(){

    List<Contact> conList=[select id,Name,Email from contact];
    
    return conList;
   }
}