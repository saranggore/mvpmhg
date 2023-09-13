({
	doInit: function(component, event, helper) {
        // Prepare a new record from template
        component.find("contactRecordCreator").getNewRecord(
            "Contact", // sObject type (objectApiName)
            null,      // recordTypeId
            false,     // skip cache?
            $A.getCallback(function() {
                
            })
        );
    },
    saveme : function(component, event, helper){
        component.find("contactRecordCreator").saveRecord(function(result){
            alert('Created'+result.recordId);
        });
    }
})