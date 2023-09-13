({
	calculate : function(component, event, helper) {
		var a=component.find("amount").get("v.value");
        var r=component.find("rate").get("v.value");
        var y=component.find("years").get("v.value");
        var z=a*r*y/100;
        component.set("v.interest",z);
        component.set("v.amount",a);
        component.set("v.rate",r);
        component.set("v.years",y);
        if(z>0){
        component.set("v.flag",false);
        }
	}
})