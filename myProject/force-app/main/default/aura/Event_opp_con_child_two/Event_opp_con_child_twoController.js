({
	search2 : function(component, event, helper) {
		component.set('v.columns', [
            {label: 'LastName', fieldName: 'LastName', type: 'text'},
            {label: 'FirstName', fieldName: 'FirstName', type: 'text'}
        ]);
         var action=component.get("c.conId");
         var accId=event.getParam("accId");
         console.log("account id"+accId);
         action.setParams({"accin":accId});
         action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
            var result=response.getReturnValue();
            component.set("v.data",result);
            component.set("v.flag","true");
            }
            });
            $A.enqueueAction(action);
	}
})