({
	add : function(component, event, helper) {
        var a=component.get("v.num1");
        var b=component.get("v.num2");
        var c=parseInt(a)+parseInt(b);
        component.set("v.num3",c);
		
	},
    mul : function(component, event, helper) {
		var a=component.get("v.num1");
        var b=component.get("v.num2");
        var c=parseInt(a)*parseInt(b);
        component.set("v.num3",c);
	}
})