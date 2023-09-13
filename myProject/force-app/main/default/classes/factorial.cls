public class factorial {
    
    public static void factNumber(){
        integer x=3;
        integer fact=1;

        for(integer i=x;i>=1;i--){
        fact=fact*i;
        }
        system.debug('Factorial is '+fact);

    }
}