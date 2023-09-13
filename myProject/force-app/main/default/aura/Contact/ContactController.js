({
	callMe : function(component, event, helper) {
       component.set('v.columns',[
           {label: 'Name', fieldName:'Name', type: 'Name'},
            {label: 'Candidate Name', fieldName: 'Candidate_Name__c', type: 'Lookup'},
                    {label: 'Phone', fieldName:'Phone', type: 'Phone'},
                    {label: 'Email', fieldName:'Email', type: 'Email'},
            {label: 'Record Type', fieldName:'Record_Type_Global__c', type: 'Picklist'}
            ]);
                     
		console.log('Event Captured');
        var nam=event.getParam('dspName');
        var action=component.get("c.showContact");
        action.setParam({'dName':nam});
        action.setCallback(this,function(response){
           var state=response.getState();
           console.log('State'+state);
           var result=response.getReturnValue();
           console.log('size'+result);
           component.set("v.data",result);
            
        });
        $A.enqueueAction(action);
    }
           
})