@isTest
public class TestVerifyDate {
    @isTest
    static void method1(){
        date start=date.parse('1/9/20');
        date theend=date.parse('1/10/20');
        date expected=date.parse('1/10/20');
        date method1test1=verifyDate.CheckDates(start, theend);
        system.assertEquals(expected, method1test1);
        
    }
    
    static void method2(){
        date start=date.parse('1/9/20');
        date theend=date.parse('2/9/20');
        date method1test2=verifyDate.SetEndOfMonthDate(start);
              date expected1=date.parse('1/9/20');
        system.assertEquals(expected1, method1test2);
    }
    
    static void method9(){
        date start=date.parse('2/9/20');
        date theend=date.parse('12/12/21');
     boolean method1test2=verifyDate.DateWithin30Days(start, theend);
            //  date expected1=date.parse('30/9/20');
        system.assertEquals(false, method1test2);
    }
    
        static void method19(){
        date start=date.parse('2/9/20');
        date theend=date.parse('1/10/20');
     boolean method1test22=verifyDate.DateWithin30Days(start, theend);
            //  date expected1=date.parse('30/9/20');
        system.assertEquals(false, method1test22);
    }
    
    static void method3(){
        date start=date.parse('1/9/20');
    date theend=date.parse('2/19/20');
        date method1test=verifyDate.SetEndOfMonthDate(start);
        date expected11=date.parse('30/9/20');
        system.assertEquals(expected11, method1test);
    }
}