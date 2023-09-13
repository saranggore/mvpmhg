({
	search : function(component, event, helper) {
        var a1=component.get("v.accName");
        var a2=component.get("v.accIndustry");
        var action=component.get("c.acccId");
        action.setParams({"aName":a1,"aIndu":a2});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS')
            {
                var a3=response.getReturnValue();
                if(a3!='Error')
                {
                 var evt=$A.get("e.c:Event_opp_con");
                 evt.setParams({"accId":a3});
                 evt.fire();
                }
            }
        });
        $A.enqueueAction(action);
    }
})