public class lead_button_extension {
    public lead leads{set;get;}
    public contact con{set;get;}
   
    public lead_button_extension(ApexPages.StandardController controller){
        con=new contact();
    }
    public pagereference callMe(){
        insert con;
        return null;
    }
}