({
	demoka : function(component, event, helper) {
        
		var action=component.get("c.demo9");
        action.setParams({"con1":component.get("v.conts")});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                var result=response.getReturnValue();
                console.log(result);
            }
        });
        $A.enqueueAction(action);
	},
    kare :function(component,event,helper){
        component.set('v.columns', [
            {label: 'First Name', fieldName: 'FirstName', type: 'text'},
            {label: 'Last Name', fieldName: 'LastName', type: 'text'},
            {label: 'Phone', fieldName: 'Pone', type: 'text'},
     
        ]);
        
        var action=component.get("c.demo10");
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                var res=response.getReturnValue();
                component.set("v.data",res);
            }
        });
        $A.enqueueAction(action);
    }
})