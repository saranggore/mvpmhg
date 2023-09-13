({
	submit : function(component, event, helper) {
        console.log("one success");
		var action=component.get("c.demo2");
        action.setParams({"conT":component.get("v.con")});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==="SUCCESS")
            {
              var res=response.getReturnValue();
            console.log(res);
            }
        });
	$A.enqueueAction(action);
    }
})