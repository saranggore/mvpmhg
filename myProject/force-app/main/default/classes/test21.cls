public class test21 {
    public test21(){
        Apexpages.Message msg1=new Apexpages.Message(Apexpages.severity.confirm,'success message');
        Apexpages.Message msg2=new Apexpages.Message(Apexpages.severity.error,'Error message');
        Apexpages.Message msg3=new Apexpages.Message(Apexpages.severity.warning,'Warning message');
        
        Apexpages.addMessage(msg1);
        Apexpages.addMessage(msg2);
        Apexpages.addMessage(msg3);
        
        
    }
}