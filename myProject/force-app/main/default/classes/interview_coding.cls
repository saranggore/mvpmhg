//Find Largets number from array
public class interview_coding {
    public static void largetsIntegr(){
        integer[] num=new integer[]{9,16,11,88,77};
        integer min=num[0];
        integer max=num[0];
        for(integer i=1;i<num.size();i++)
        {
            if(num[i]>max)
            {
                max=num[i];
            }
            if(num[i]<min)
            {
                min=num[i];
            }
        }
        system.debug('Max number is:'+max);
        system.debug('Min number is:'+min);
    }
 //fiiding pallingdrome number   
    public static void Pallindrome()
    {
        string fir='CIVIC';
        string sec=fir.reverse();
        if(fir==sec)
        {
            system.debug('String is palingdrome');
        }
        else 
        {
            system.debug('String is not Palingdrome');
        }
    }
 // Finding Pallingdrome without using functions
    public static void PalliWithFUnction()
    {
        string fir='CIVIC';
        string result='';
        for(integer i=fir.length()-1;i>=0;i--)
        {
            result=result+fir.substring(i,i+1);
        }
        if(result==fir)
        {
            system.debug('string is pallingdrome');
        }
        else
        {
            system.debug('System is not pallingdrome');
        }
    }   
    
    //Find missing number from array
    public static void missing()
    {
        integer[] num1=new integer[]{1,2,3,4,5,7,8,9,10};
        for(integer i=1;i<=10;i++)
        {
            if(num1.contains(i)){
               continue;
            } 
            else
            {
                system.debug('Missing number is '+i);
            }
        }
    }
    //finding duplicate in array
    public static void deuplicateFinding()
    {
        integer[] first=new integer[]{1,2,2,3,4,5,6,7,8,9,10,10};
            
        List<integer> demo=new List<integer>();
        for(integer i=0;i<=first.size()-1;i++)
        {
           for(integer j=0;j<=first.size()-1;j++)
           {
               if(first[i]==first[j] && i!=j)
               {
                   system.debug('Duplicate number is '+first[i]);
               }
           }
        }
        
    } 
    //Given two arrays, 1,2,3,4,5 and 2,3,1,0,5 find which number is not present in the second array.
    public static void demo22()
    {
        integer[] first=new integer[]{1,2,3,4,5};
        integer[] second=new integer[]{2,3,1,0,5}; 
            for(integer i=0;i<=first.size()-1;i++)
        {
            if(second.contains(first[i]))
            {
                continue;
                
            }
            else
            {
                system.debug('Not present '+first[i]);
                
            }
        }
            
    }
    //second highest number in array.
    public static void secondHighestNum()
    {
        integer[] second=new integer[]{1,22,13,24,5};
            system.debug('size'+second.size());
            second.sort();
        
        system.debug('Second Highest Number is '+second[second.size()-2]);
    }
    //prime number
    
    public static void PrimeNumber()
    {
      
         
        for(integer a=2;a<=100;a++){
            integer count=0;
       for(integer i=2;i<=a;i++)
       {
           
           if(math.mod(a,i)==0 && i!=a)
           {
               system.debug('Number is Not prime:'+a);
               count++;
              break;
           }
       }
      
        if(count<1)
        {
            system.debug('Number is prime'+a);
        }
        }
    }
    //* pime number 2
    public static void prime2()
    {
        integer x=7;
        integer count=0;
        for(integer i=1;i<=x;i++)
        {
            if(math.mod(x,i)==0)
            {
                count++;
            }
        }
        system.debug('count='+count);
        if(count==2)
        {
            system.debug('Number is prime');
        }
        else
        {
            system.debug('Number is not prime');
        }
    }
    //program for leap year
    //1.Divisible by 4 then check 
    //2.Divisible by 100  ....if not Its leao year else
    //3.If divisible by 400....its leap year
    public static void leapYear()
    {
        integer year=2000;
        if(math.mod(year, 4)==0)
        {
            if(math.mod(year, 100)!=0)
            {
                system.debug('ITs a leap year');
            }
            if(math.mod(year, 400)==0)
            {
                system.debug('Its a leap year');
            }
            else
            {
                system.debug('Its not leap year');
            }
        }
    }
    
    // Star Triangle
    public static void stardraw(){
        string star='';
        for(integer i=1;i<=5;i++){
           for(integer j=1;j<=i;j++){
               star=star+'*';
            }
            system.debug(''+star);
            star='';
         }
    }
    //Star Inverted triangle
    public static void stardraw2(){
        string star='';
        for(integer i=5;i>=1;i--){
            for(integer j=i;j>=1;j--){
               star=star+'*';
            }
            system.debug(''+star);
            star='';
         }
    }
}