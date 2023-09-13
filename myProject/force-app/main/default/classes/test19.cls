public class test19 {
    public integer amount{get;set;}
    public integer rate{get;set;}
    public integer years{get;set;}
    public integer intrest{get;set;}
    public void simple(){
        
        intrest=(amount*rate*years)/100;
    }
    public void cancel(){
        
        amount=0;
        rate=0;
        years=0;
        intrest=0;
    }
}