////Practice examples:::1.Swap two numbers  2.Skip number 3.Print second highest and second lowest 4.Print only 10 accounts  5.Calculate percentage from obtained marks

public class practiceExamples 
{
    public practiceExamples(apexPages.StandardController controller)
    {
        
    }
///swap two numbers without using another variable
    public static void swap()
    {
        integer A=10;
        integer B=20;
        A=A+B;
        B=A-B;
        A=A-B;
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'A=10 & B=20:::Swap Values are A='+A+'   & B='+B));
    }    
///method to skip number from 50-60 while printing 1-100
    public void skip()
    {
         for(integer i=1;i<=100;i++)
         {
            if(i>=50 && i<=60)
            {
                continue;
            }
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Number----->'+i));
        }   
        
    }
///Print second highest number from array
    public static void secondHigh()
    {
        integer[] a=new integer[]{8,2,4,3,9,1,5,7,6};
        a.sort();
        integer b=a.size()-2;
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Second largest Number of string {8,2,4,3,9,1,5,7,6} is::'+a[b])); 
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Second lowest Number of string {8,2,4,3,9,1,5,7,6} is::'+a[1]));    
    }       

///Show only 10 Account records using break  
    public static void onlyTenAccount()
    {
        for(integer i=1;i<20;i++)
        {
            list<Account> acc=[select Id,Name from account];
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Account Name----->'+acc[i].Name));
            if(i>9)
            {
                break;
            }
        }
    }
///calculate percentage from obtained marks    
    public static void percentage()
    {
       string xmlString='<Result>';
       xmlString+='<Subject>English</Subject>';
       xmlString+='<Marks_obtained>cc</Marks_obtained>';
       xmlString+='<Total_Marks>100</ Total_Marks>';
       xmlString+='</Result>' ;
       string obtained=xmlString.substringBetween('<Marks_obtained>','</Marks_obtained>');
       string total= xmlString.substringBetween('<Total_Marks>','</ Total_Marks>');
       try
       {
       integer obt=integer.valueOf(obtained);
       integer tot=integer.valueOf(total);
       integer per=obt/tot*100; 
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'percentage='+per+'%'));
       }
       catch(exception e)
       {
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'Please enter correct marks insted of---->'+obtained));
       }
    }

}