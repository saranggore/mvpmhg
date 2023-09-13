public class dateFunction {
    public dateFunction(){
        
    }
    public static void monthCal(){
        string month='March';
        integer year=2020;
        integer monthNumber;
        list<string> lst= new list<string>{'January','February','March','April','May','June','April','May','June','Jully','August','september','october','November','December'};
            for(integer i=0;i<=lst.size();i++){
                if(month==lst[i]){
                    monthNumber=i+1;
                    break;
                }
            }
    date ex1=Date.newInstance(2020,monthNumber,25);
    system.debug('**********'+monthNumber);
    system.debug('**********'+ex1);    
    }
}