({
	save : function(component, event, helper) {
        var acc1=component.get('v.acc');
        var evt=component.getEvent("mgm");
            evt.setParams({'account':acc1});
        evt.fire();
	}
})