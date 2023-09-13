({
	init : function(component, event, helper) {
		 var action = component.get('c.getCountryCode');
        action.setCallback(this, function(response) {
        var state = response.getState();
        if (state === "SUCCESS") {
            var resp = response.getReturnValue();
            var countryList = [];
            for(var key in resp){
                countryList.push({'label':resp[key] , 'value': key});
            }
            component.set("v.countryOptions", countryList);
            system.debug('Size'+countryList.size());
        }
    });
    $A.enqueueAction(action);
	}
})