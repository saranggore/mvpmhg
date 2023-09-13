////print second highest and second lowest number 
public class printGivenNumber {
    public printGivenNumber(apexPages.StandardController controller){
        
    }
///Print secong highest number from array
    public static void secondHigh(){
        integer[] a=new integer[]{8,2,4,3,9,1,5,7,6};
        a.sort();
        integer b=a.size()-1;
    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Second largest Number of string {8,2,4,3,9,1,5,7,6} is::'+b)); 
    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Second lowest Number of string {8,2,4,3,9,1,5,7,6} is::'+a[1]));    
    }     
}