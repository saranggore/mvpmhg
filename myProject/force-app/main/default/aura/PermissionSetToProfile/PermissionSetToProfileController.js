({
	Assign : function(component, event, helper) {
		var profi=component.get("v.Profile");
        console.log('Profine Name'+profi);
        var permi=component.get("v.Permissionset");
        console.log('Permission set Name'+permi);
        var action=component.get("c.assignpermi");
        action.setParams({'profiles':profi,'Sett':permi});
        action.setCallback(this,function(response){
            
            var state=response.getState();
            console.log('ONE----->'+state);

            if(state=='SUCCESS')
            {
                console.log('TWO');
                alert('ASsigned SUccessfully');
            }
        });
        $A.enqueueAction(action);
	}
})