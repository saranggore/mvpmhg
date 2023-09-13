({
	show : function(component, event, helper) {
		var evt=component.getEvent("first");
        evt.setParams({"Name":"Mayur Gore"})
        evt.fire();
	}
})