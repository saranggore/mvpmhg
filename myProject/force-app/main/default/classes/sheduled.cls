public class sheduled implements schedulable {
    public void execute(schedulablecontext sc){
        List<lead> ams=new List<lead>();
        lead a=new lead();
        a.lastName='Scheduled';
        a.company='Gim cargo';
        a.mobilePhone='123456';
        ams.add(a);
    }
}