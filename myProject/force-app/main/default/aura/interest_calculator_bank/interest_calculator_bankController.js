({
	Submit : function(component, event, helper) {
		var a=component.get("v.amount");
        var b=component.get("v.Rate");
        var c=component.get("v.Years");
        var d=a*b*c/100;
        component.set("v.interest",d);
	},
    
    Reset : function(component, event, helper) {
		component.set("v.amount",0);
        component.set("v.Rate",0);
        component.set("v.Years",0);
        component.set("v.interest",0);
	}
})