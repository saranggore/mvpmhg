public class CaseComment {
@AuraEnabled
    public static void createcom(string caseId,string commentInsert,string stage)
    {
        case updatecase=new case();
        updatecase.Id=caseId;
        updatecase.Comments=commentInsert;
        updatecase.Origin=stage;
        if(updatecase.Origin!='--None--')
        {
            update updatecase;
       	}
        else
        {
	        throw new AuraHandledException('Error Exception happend');           
        }
    }
@AuraEnabled
    public static List<string> recordtypeget(string reco){
        List<string> stages=new List<string>();
       case demo2=[select id,RecordTypeId from case where id=:reco];
       string recName= [SELECT Name FROM RecordType where Id=:demo2.RecordTypeId].Name;
        if(recName=='Inquiry')
        {
            stages.add('--None--');
            stages.add('Phone');
            stages.add('Email');
        }
        if(recName=='Product Support')
        {
            stages.add('--None--');
            stages.add('Web');
            stages.add('Lead');
        }
             return stages;
       
    }    
}