({
	init : function(component, event, helper) {
         component.set('v.columns',[
                     {label:'Account Name',fieldName:'Name',type:'text'},
                     {label:'Email',fieldName:'Email__c',type:'Email'},
                     {label:'Industry',fieldName:'Industry',type:'Picklist'},
                     {label:'Ownership',fieldName:'Ownership',type:'Picklist'},
                     {label:'Phone',fieldName:'Phone',type:'Phone'}
         ]);
                     
		var action=component.get("c.getaccount");
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==="SUCCESS"){
                var result=response.getReturnValue();
        console.log('Size'+result)
            component.set("v.data",result);
            }
                
                
            
        });
	$A.enqueueAction(action);
    }
})