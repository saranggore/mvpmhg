public class delete_leads {
    public List<lead> leads{set;get;}
    public delete_leads(apexpages.StandardSetController controller){
        leads=(List<lead>)controller.getSelected();
        
    }
    public pagereference callMe(){
        delete leads;
        return null;
        
    }
}