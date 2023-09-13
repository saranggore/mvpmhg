public class AssignPermissionSetToProfile {
@AuraEnabled
    public static void assignpermi(string profiles,string Sett)
    {
        PermissionSet permii=[select id from PermissionSet where Label=:Sett];
        List<PermissionSetAssignment> permiList=new  List<PermissionSetAssignment>();
        List<PermissionSetAssignment> userinfo=[SELECT AssigneeId FROM PermissionSetAssignment WHERE PermissionSet.Label =:Sett];
        set<Id> userId=new set<Id>();
        for(PermissionSetAssignment dd:userinfo)
        {
            userId.add(dd.AssigneeId);
        }
        for(user one:[SELECT Id,UserRole.Name,Profile.Name,IsActive FROM User WHERE Profile.Name =: profiles ])
        {
            if(userId.contains(one.Id))
            {
                system.debug('Already added user');
            }
            else
            {
            PermissionSetAssignment psa = new PermissionSetAssignment(PermissionSetId = permii.id, AssigneeId = one.Id);
            permiList.add(psa);
            }
        }
        upsert permiList;
    }
}