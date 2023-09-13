({
	callMe : function(component, event, helper) {
		var newContact=component.get("v.newContact");
        var myEvent=component.getEvent("Mayur");
        myEvent.setParams({"con":newContact});
        myEvent.fire();
	}
})