({
	create : function(component, event, helper) {
		var action=component.get("c.demo9");
        var contactList=component.get("v.contactList");
        action.setParams({"con1":component.get("v.contt")});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                var res=response.getReturnValue();
               contactList.splice(0,0,component.get("v.contt"));
                component.set("v.contactList",contactList);
            }
            
           
        });
         $A.enqueueAction(action);
	},
    callMe: function(component, event, helper) {
     var action=component.get("c.demo10");
    action.setCallback(this,function(response){
        var state=response.getState();
        if(state==="SUCCESS")
        {
    var ress=response.getReturnValue();
    component.set("v.contactList",ress);
            
        }
});
    $A.enqueueAction(action);
}
})