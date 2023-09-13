({
	Submit : function(component, event, helper) {
		var a=component.get("v.Amount");
        var y=component.get("v.Years");
        var r=component.get("v.Rate");
        var i=a*y*r/100;
        component.set("v.Interest",i);
	},
    Reset : function(component, event, helper) {
		component.set("v.Amount",null);
        component.set("v.Years",null);
        component.set("v.Rate",null);
        component.set("v.Interest",null);
	}
})