public class test23 {
    public test23(){
    ApexPages.Message mag1=new ApexPages.Message(ApexPages.Severity.error,'error');
    ApexPages.Message mag2= new ApexPages.Message(ApexPages.severity.warning,'warning');    
    ApexPages.Message mag3= new ApexPages.Message(ApexPages.severity.confirm,'Success');
        ApexPages.addMessage(mag1);
        ApexPages.addMessage(mag2);
        ApexPages.addMessage(mag3);
}
}