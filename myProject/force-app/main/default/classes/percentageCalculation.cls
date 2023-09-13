////Calculate percentage from obtained marks
public class percentageCalculation {
    public percentageCalculation(ApexPages.StandardController controller){
        
    }
///calculate percentage from obtained marks    
    public static void percentage(){
       string xmlString='<Result>';
       xmlString+='<Subject>English</Subject>';
       xmlString+='<Marks_obtained>80</Marks_obtained>';
       xmlString+='<Total_Marks>100</ Total_Marks>';
       xmlString+='</Result>' ;
       string obtained=xmlString.substringBetween('<Marks_obtained>','</Marks_obtained>');
       string total= xmlString.substringBetween('<Total_Marks>','</ Total_Marks>');
       integer obt=integer.valueOf(obtained);
       integer tot=integer.valueOf(total);
       integer per=obt*100/tot; 
    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'percentage>'+per+'%'));
    }
}