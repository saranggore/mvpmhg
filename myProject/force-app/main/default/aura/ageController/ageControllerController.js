({
    save : function(component, event, helper) {
        var name=component.get("v.Name");
        var phone=component.get("v.Phone");
        var rating=component.get("v.Rating");
        var industry=component.get("v.Industry");
        var demo=component.get("c.reAge");
        demo.setParams({"name":name,"phone":phone,"rating":rating,"industry":industry});
        demo.setCallback(this,function(response){
            var state=response.getState();
            //if(state==='SUCCESS'){
            var result=response.getReturnValue();
            component.set("v.flag",true);
            component.set("v.result",result);
            //component.set("v.Name",result.name);
            //component.set("v.Phone",result.phone);
            //component.set("v.Rating",result.rating);
            //component.set("v.Industry",result.industry);
            //}
        });
        $A.enqueueAction(demo);
    }
	
})