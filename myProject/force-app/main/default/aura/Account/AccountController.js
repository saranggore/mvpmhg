({
	doit : function(component, event, helper) {
		var action=component.get("c.dspNameOne");
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==="SUCCESS")
            {
                var result=response.getReturnValue();
                component.set("v.StagePicklist",result);
            }
        });
        $A.enqueueAction(action);
	},
    showField:function(component, event, helper) {
        var selected=component.get("v.selectedValue");
        console.log('Selected is '+selected);
        var evt = $A.get("e.c:Account_event");
        console.log('Event is '+evt);
        evt.setParams({"dspName":selected});
        evt.fire();
    }
})