@isTest
public class SelfAccountTrigger_test
 {
    static testmethod void myTest()
	{
      Boolean result =false;
    
      Account acc1=new account();
      acc1.Name= 'riya';
      acc1.email__c='riyakutte123@gmail.com';
    
      try
	   {
          insert acc1;
       }
      catch(DMLException ex)
       {
          result=true;
          system.assert(result);
       }
    
       Account acc = new Account(); 
       acc.Name = 'Test Account';
       acc.email__c = '';
    
	   try
	   {
         insert acc;   
       }
       catch(Exception e)
	   {
       string expetd='You Cannot Create Account without email'; 
       string actual= e.getMessage();
       system.assert(actual.contains(expetd));
       }
    
	  acc1.Name = 'Test Account 1'; 
      acc1.Description = 'Winner'; 
      update acc1;
    
      try
	  {
       delete acc1;
      }
      catch(Exception e)
	  {
      string expetd1='Cannot Delete if Account if Description is Available'; 
      string actual1= e.getMessage();
      system.assert(actual1.contains(expetd1));
      } 
      acc1.Description = '';    
      update acc1;
      delete acc1;
    }
}