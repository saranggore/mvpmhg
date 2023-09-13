public class fibonacci {
    public static void fibonacciResult()
    {
    integer i=0;
    integer j=1;
        
    for(integer k=0;k<=100;k++)
    {
        integer sum=i+j;
        i=j;
        j=sum;
        system.debug(sum);
    }   
        
    }
}