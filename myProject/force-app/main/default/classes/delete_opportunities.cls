public class delete_opportunities {
 public List<opportunity> opportunities {set;get;}
    public delete_opportunities(apexpages.StandardSetController controller){
        List<string> fields=new list<string>{'Name'}  ;
        controller.addFields(fields);
        opportunities=(List<opportunity>)controller.getSelected();
    }
    
    public pagereference callME(){
        
        delete opportunities;
        return null;
    }

}