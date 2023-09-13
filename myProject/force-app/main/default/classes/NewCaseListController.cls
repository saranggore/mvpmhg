public class NewCaseListController {
    public List<Case> getNewCases()
    {
        List<case> res=[select ID,CaseNumber from case where status='New'];
        return res;
    }
}