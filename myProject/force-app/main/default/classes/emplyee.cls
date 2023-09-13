public class emplyee {
  public  List<profile> need {set;get;}
    public  emplyee()
    {
       
      need=[SELECT Name,Id,UserType,UserLicenseId,PermissionsViewRoles,SystemModstamp FROM Profile];
      
  
    }
}