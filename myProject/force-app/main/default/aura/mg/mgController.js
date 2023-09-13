({
	add : function(component) {
		var addvalue=component.get("v.num1")+component.get("v.num2");
        component.set("v.Sum",addvalue);
	}
})