public class reverseString {
    
    public static void reveString(){
    //solution one
        string originalString='MAYUR';
        string reversed=originalString.reverse();
        system.debug('Result'+reversed);
    
    //solution two
       string res='';
        for(integer i=originalString.length()-1;i>=0;i--){
            res+=originalString.substring(i,i+1);
        } 
        system.debug('Solution2'+res);
    }
}