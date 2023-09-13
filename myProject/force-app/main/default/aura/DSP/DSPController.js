({
	init : function(component, event, helper) {
		component.set('v.columns', [
            {label: 'DSP Name', fieldName: 'Company_Name__c', type: 'text',
             },
        ]);
       
        var action= component.get("c.getdspName");  
            action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS')
            {
            var result=response.getReturnValue();  
            component.set("v.data",result);
            }
            });
         $A.enqueueAction(action);
	},
    handleRowAction  : function(component, event, helper) {
          var acc = event.getParam('action');
            var action=component.get("c.")
            action.setCallback(this,function(response){
            var state=response.getState();
            if(state===SUCCESS)
            {
            
            }
            });
            $A.enqueueAction(action);
            }
})