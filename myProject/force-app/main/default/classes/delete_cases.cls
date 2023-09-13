public class delete_cases {

    public List<case> cases {set;get;}
    public delete_cases(apexpages.StandardSetController controller){
        List<string> fields=new list<string>{'Owner'}  ;
        controller.addFields(fields);
        cases=(List<case>)controller.getSelected();
    }
    
    public pagereference callME(){
        
        delete cases;
        return null;
    }

}