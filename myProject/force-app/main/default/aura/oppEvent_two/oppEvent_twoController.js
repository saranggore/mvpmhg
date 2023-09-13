({
	init : function(component, event, helper) {
		component.set('v.columns', [
            {label: 'Id', fieldName: 'Id', type: 'text'},
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'StageName', fieldName: 'StageName', type: 'string'}
        ]);
        
         var action=component.get("c.oppList");
         var acc=event.getParam("accId");
         console.log('++++++id======'+acc);
         action.setParams({"idacc":acc});
         action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS')
            {
                var result=response.getReturnValue();
                console.log("======="+result);
                component.set("v.data",result);
            }
        });
        $A.enqueueAction(action);
	}
})