////TO perform collection operation 
public class Apex_calculation 
{
    public Apex_calculation(ApexPages.StandardController controller)
    {
    }
/// show error message 
    public static void Condition()
    {
       //map to query example
        map<string,Employee__c> MapEmp=new map<string,Employee__c>([select name,Email__c,Phone__c from Employee__c]);
        for(string key:MapEmp.keyset())
        {
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'key----->'+key+'      value---->'+MapEmp.get(key)));
        }   
       
       //List operation exapmle 
        List<string> emp=New list<string>();
        emp.add('Emp1');
        emp.add('Emp2');
        emp.add('Emp3');
        emp.add('Emp4');
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'List of Employee'+JSON.serialize(emp)));
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'List of Employee'+JSON.serialize(emp[3])));
        
        //list to query example
        List<Employee__c> emp1=new List<Employee__c>([select Employee_Id__c from Employee__c]);
        for(Employee__c employee:emp1)
        {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Employee Id----->'+employee));
        }
    }
}