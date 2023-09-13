({
	callMe:function(component, event, helper) {
        var nam=component.get("v.Name");
        var Rating=component.get("v.Rating");
        var Industry=component.get("v.Industry");
        var phone=component.get("v.Phone");
		var abc=component.get("c.invke");
        abc.setParams({"Name":nam,"Rating":Rating,"Industry":Industry,"Phone":phone});
        abc.setCallback(this,function(response){
                     var name=response.getReturnValue();  
                       component.set("v.RecordId",name);
                      })      
                      $A.enqueueAction(abc); 
	},
    novalue:function(component, event, helper) {
        component.set("v.Name",null);
        component.set("v.Rating",null);
        component.set("v.Industry",null);
        component.set("v.Phone",null)
        
    }
})