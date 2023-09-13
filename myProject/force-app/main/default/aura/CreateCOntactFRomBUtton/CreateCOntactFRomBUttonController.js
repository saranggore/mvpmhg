({
	save : function(component, event, helper) {
		var action=component.get("c.createcontact");
        action.setParams({'con':component.get("v.cont")});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS')
            {
                var dismissActionPanel=$A.get("e.force:closeQuickAction");
                dismissActionPanel.fire();
            }
        });
        $A.enqueueAction(action);
	}
})