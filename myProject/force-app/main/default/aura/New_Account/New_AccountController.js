({
	addme : function(component, event, helper) {
		var newAccount=component.get("v.newAccount")
        var myEvent=component.getEvent("satish");
        myEvent.setParams({"acc":newAccount});
        myEvent.fire();
	}
})