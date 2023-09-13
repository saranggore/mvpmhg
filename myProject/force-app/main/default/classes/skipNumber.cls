////print 1-100 but not 50-60 if else and loop
public class skipNumber {
    public skipNumber(ApexPages.StandardController controller)
    {
        
    }
///method to skip number
    public void skip(){
         for(integer i=1;i<=100;i++)
         {
            if(i>=50 && i<=60)
            {
                continue;
            }
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Number----->'+i));
        }   
        
    }
}