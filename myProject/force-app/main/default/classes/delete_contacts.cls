public class delete_contacts {
    List<contact> contacts{set;get;}
    public delete_contacts(apexpages.StandardSetController controller){
        List<string> fields=new List<string>{'phone'};
        controller.addFields(fields);
        contacts=(List<contact>)controller.getSelected();
        
    }
    public pagereference callMe(){
        
        delete contacts;
        pagereference p=new pagereference('/003/o');
        return p;
    }
}