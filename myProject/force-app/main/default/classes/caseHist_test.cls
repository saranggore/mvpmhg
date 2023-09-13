@isTest
public class caseHist_test {
 @testSetup
    public static void  setupMethod()
    {
        List<case> caseToInsert=new List<case>();
        
        case case_1=new case();
        case_1.Status='New';
        case_1.Origin='Phone';
        case_1.CurrencyIsoCode='EUR';
        caseToInsert.add(case_1);
        
        case case_2=new case();
        case_2.Status='Working';
        case_2.Origin='Email';
        case_2.CurrencyIsoCode='EUR';
        caseToInsert.add(case_2);    
        
        insert caseToInsert;
    }
    @istest
    public static void caseHistory()
    {
        List<case> updateCase=[select Id,Status,Origin,CurrencyIsoCode from Case];
        case caseUpdat=updateCase[0];
        caseUpdat.CurrencyIsoCode='USD';
        try
        {
        update caseUpdat;
        }
        catch(exception e)
        {
            system.debug('Error----->'+e.getMessage());
        }
    }
}