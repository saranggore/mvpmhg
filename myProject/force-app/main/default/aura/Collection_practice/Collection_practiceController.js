({
	myAction : function(component, event, helper) {
		var num = [];
        for(var i=0;i<20;i++)
        {
            num.push({ value: i});
        }
        component.set("v.number",num);
    }
})