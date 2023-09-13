public class DSP_LANDING_Page {
@AuraEnabled
    public static List<string> dspNameOne(){
    List<string> names=new List<String>();
        List<Account> dsp=[select Id,name from account];
        for(Account acc:dsp)
        {
            names.add(acc.Name);
        }
        return names;
    }
  @AuraEnabled
    public static List<contact> showContact(string dName){
        system.debug('DSP NAme'+dName);
        List<contact> canDsp=new List<contact>([select Id,Name,Phone,Email from contact where account.Name=:dName]);
        system.debug('est8888888');
        return canDsp;
    }
}