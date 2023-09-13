@isTest
public class tetsClass_rest_test1 {
@isTest
    static void testme(){
       response_test1 fk=new response_test1();
        Test.setMock(HttpcalloutMock.class,fk);
        rest_test1 zf=new rest_test1();
        zf.invoke();
        contact con=[select lastName,firstName,phone from contact where createdDate=TODAY];
        system.assertEquals('Myla',con.LastName);
         system.assertEquals('satish',con.FirstName);
         system.assertEquals('phone',con.phone);
    }
}