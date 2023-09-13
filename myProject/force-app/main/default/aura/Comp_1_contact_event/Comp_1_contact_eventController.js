({
	create : function(component, event, helper) {
		var test1=component.get("v.newAccount");
        var myevent=component.getEvent("mayur");
        myevent.setParams({"acc":test1});
        myevent.fire();
	}
})