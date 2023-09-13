public class newopportunitycontroller {
    Account account;
    Contact contact;
    Opportunity opportunity;
    OpportunityContactRole role;
    
    public Account getaccount()
    {
        if(Account==null)
            account=new account();
        return account;
    }
    
    public contact getcontact()
    {
        if(contact==null)
            contact=new contact();
        return contact;
    }
    
    public opportunity getopportunity()
    {
        if(opportunity==null)
            opportunity=new opportunity();
        return opportunity;
        
    }
           
    public opportunityContactRole getrole()
    {
        if(Role==null)
        Role=new opportunityContactRole();
        return role;
    }
    
    public pageReference step1()
    {
        return page.opptystep1;
    }
    
    public pageReference step2()
    {
        return page.opptystep2;
    }
    
    
    public pageReference step3()
    {
        return page.opptystep3;
    }
    
    public PageReference cancel() {

      PageReference opportunityPage = new PageReference('/006');

      opportunityPage.setRedirect(true);

      return opportunityPage;

    }
public pageReference save()
{
    account.phone=contact.phone;
    insert account;
    
    contact.AccountId=account.Id;
    insert contact;
    
    opportunity.accountId=account.Id;
    insert opportunity;
    
    role.opportunityId=opportunity.id;
    role.contactId=contact.Id;
    insert role;
    
  PageReference opptyPage = new ApexPages.StandardController(opportunity).view();
  opptyPage.setRedirect(true);
  return opptyPage;

    
}
}