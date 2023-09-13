({
	search : function(component, event, helper) {
		var accname=component.get("v.accName");
        var accIndus=component.get("v.accIndustry");
        var action=component.get("c.accid");
        action.setParams({"accName":accname,"accIndust":accIndus});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state=='SUCCESS')
            {
                var result=response.getReturnValue();
                if(result!='Error')
                {
                    var evt=$A.get("e.c:oppEvent");
                    evt.setParams({"accId":result});
                    evt.fire();
                }
            }
        });
        $A.enqueueAction(action);
	}
})