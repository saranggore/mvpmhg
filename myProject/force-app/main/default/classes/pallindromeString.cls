public class pallindromeString {
    public static void pallindrom(){
        string name='EYE';
        string blankstring='';
        for(integer i=name.length()-1;i>=0;i--)
        {
            blankstring=blankstring +name.substring(i,i+1);
        }
        
        if(blankstring==name){
            system.debug('String is palindrome');
        }
        else{
            system.debug('String is Not palindrome');
        }
    }
}