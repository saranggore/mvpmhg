({
	record : function(component, event, helper) {
        var message = event.getParam("myName");
        console.log('Acc name is --->'+message);
		var action=component.get("c.demo1");
        action.setParams({"acc1":message});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS')
            {
                var resu=response.getReturnValue();
                var message = event.getParam("myName");
                alert('Number of contcts='+resu);
            }
        });
        $A.enqueueAction(action);
	}
})