public with sharing class accountTeam {
@AuraEnabled(cacheable=true)
public static Map<string,string> teamMembers(string accId){
    Map<string,string> finalRec= new Map<string,string>();
    List<OpportunityTeamMember> team =[select id,Name,TeamMemberRole from OpportunityTeamMember where opportunityId=:accId];
    for(OpportunityTeamMember aa: team)
    {
        Team_Member__c xr=Team_Member__c.getInstance(aa.TeamMemberRole);
        finalRec.put(aa.Name,xr.shortForm__c);
    }
    return finalRec;
}

}