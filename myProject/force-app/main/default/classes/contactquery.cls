public class contactquery{
    public List<ProcessInstance> cs{get; set;}
    public contactquery()
    {
    cs = new List<ProcessInstance>();
       for (ProcessInstance c : [Select ID, TargetObject.Name, Status, CreatedDate,

(SELECT Id,Actor.Name, StepStatus, Comments, CreatedDate FROM Steps)
From ProcessInstance])
       {       
           cs.add(c);
       }
    }
}