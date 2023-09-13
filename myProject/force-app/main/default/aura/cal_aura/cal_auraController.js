({
	result1 : function(component, event, helper) {
		var one=component.get("v.first");
        var two=component.get("v.second");
        var action=component.get("c.demo1");
        action.setParams({"one":one,"two":two});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==="SUCCESS")
            {
                var three=response.getReturnValue();
                component.set("v.Result",three);
            }
        });
        $A.enqueueAction(action);
	}
})