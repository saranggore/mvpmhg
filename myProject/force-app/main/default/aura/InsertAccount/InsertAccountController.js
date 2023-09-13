({
	create : function(component, event, helper) {
        console.log('Enter 1');
		var NameofAcc=component.get("v.Accnames");
        console.log('Entered Name='+NameofAcc);
       /* var action=component.get("c.demo1");
        action.setParams({"acc1":NameofAcc});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS')
            {
                var resu=response.getReturnValue();
                alert('Number of contcts='+resu);
            }
        });
        $A.enqueueAction(action);*/
        var event=component.getEvent("Mayu");
        event.setParams({"myName":NameofAcc}); 
        event.fire();
	}
})