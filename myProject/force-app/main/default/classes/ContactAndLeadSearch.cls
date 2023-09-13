public class ContactAndLeadSearch {
public static List<List<sobject>> searchContactsAndLeads(string smith)
{
    List<List<sobject>> searchlist=[Find 'smit' IN ALL FIELDS RETURNING LEAD(FirstName,LastName),CONTACT(FirstName,LastName)];
    return searchlist;
}
}