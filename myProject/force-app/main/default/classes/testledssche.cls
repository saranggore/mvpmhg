@isTest
public class testledssche {
@isTest
    public static void callMe()
{
    ledsSche das= new ledsSche();
    das.cute();
    
    //List<lead> ad=[select id from lead];
    //delete ad;
   // string cts='0 1 1 * ? 2022';
    //Test.startTest();
    //id jobId=system.Schedule('Bola',cts,das);
    //Test.stopTest();
    integer cou= [select count() from lead];
    system.assertEquals(0, cou);
}
}