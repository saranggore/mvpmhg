public class create_contact {
@Auraenabled
    public static string demo9(contact con1){
        insert con1;
        return con1.Id;
    }
@Auraenabled
    public static List<contact> demo10(){
        //List<contact> demo=[];
        return[select FirstName,LastName,phone from contact limit 5];
    }    
}