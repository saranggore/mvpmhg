public class vfdashboard {
public string getcontactName()
{
    return 'Mayur Gore cases';
}
    
    Public List<case> getcases(){
        return [select caseNumber,subject from case limit 5];
    }    
}