({
	addMe : function(component, event, helper) {
		var newAccount=component.get("v.newAccount");
        var myevent=component.getEvent("satish");
        myevent.setParams({"acc":newAccount});
        myevent.fire();	
	}
})