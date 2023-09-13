////String functions implementation 
public class stringFunction {
    public stringFunction(apexPages.StandardController controller){
        
    }
///Returns the current String with the first letter changed to capital case   
    public static void capitalize(){
        string small='infosys';
        string large=small.capitalize();
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Capitalize first charater of string:--------Initial string:'    +small+'------->Result:  '+large));
        deleteWhitespace();
    }
///Returns the current String with all white space characters removed
    public static void deleteWhitespace(){
        string a1='India won worldcup';
        string a2=a1.deleteWhitespace();
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Deleting whitespace:-----initial string:'+a1+'------After removing white space::'+a2));
        endString();
    }
///Check whether string ends with specified suffix    
    public static void endString(){
        String s = 'Hello Jason';
        Boolean b=s.endsWith('Jason');
        if(b==true){
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Check end string:-----Yes .string ends with required substring'));
        compareString();
        }
    }
///Compare two string
    public static void compareString(){
        string one='GoodMorning';
        string two='GoodMorning';
        Boolean result=one.equals(two);
        if(result==true) {
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Comparing string:-----Yes .Two string match'));
        }
        compareStringIgnoringCase();
    }   
///compare two string ignoring upper case
    public static void compareStringIgnoringCase(){
        string one='goodmorning';
        string two='GOODMORNING';
        Boolean result=one.equalsIgnoreCase(two);
        if(result==true) {
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Comparing string ignoring case:-----Yes .Two string match ignoring case'));
        }
    blankCheck();
    }  
///Check whether string is blank or not
    public static void blankCheck(){
        string one='';
        Boolean two=string.isBlank(one);
        if(two==true)
        {
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Check blank string:-----Given string is blank'));
        }
    numericString();
    }    
///Check given string is numeric or not
    public static void numericString(){
        string one='12345';
        Boolean two=one.isNumeric();
        if(two==true){
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Check Numeric string:-----Given string is Numeric'));
        }
    lastIndex();
    }    
///ckeck last index of string
    public static void lastIndex(){
        string one='abcdefabc';
        integer two=one.lastIndexOf('c');
    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Last index of substring abcdefabc is:::'+two));
    leftChar();
    }
///print lestmost characters of string
    public static void leftChar(){
        string one='abcdefg';
        string two=one.left(4);
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'4 left characters of string abcdefg are:::'+two));
    leftStr();
    }    
///Find length of string
 public static void leftStr(){
        string one='abcdefg';
        integer length=one.length();
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Length of string abcdefg is:::'+length));
        validateNum();   
 }
///Validate number in string    
    public static void validateNum(){
        string one='abcd100efg';
        boolean two=one.contains('100');
        if(two==true){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'GIven number is present in the string'));
        }
    }
}