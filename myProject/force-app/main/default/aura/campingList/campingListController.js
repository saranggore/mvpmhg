({
	doInit : function(component, event, helper) {
		var action=component.get("c.getItems");
        action.setCallback(this,function(response){
            var state=response.getState();
            
                var result=response.getReturnValue();
                component.set("v.items",result);
            
        });
        $A.enqueueAction(action);
	},
    createItem :function(component, event, helper) {
        	helper.createItem (component,Item);
    }
})