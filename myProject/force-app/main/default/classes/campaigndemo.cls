public class campaigndemo {
    public static  void  memo(){
    list<campaignmember> camp=new list<campaignmember>();
    {
    camp=[select name from campaignmember];
    delete camp;
    }
    }

}