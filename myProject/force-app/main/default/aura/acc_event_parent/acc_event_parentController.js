({
	saved : function(component, event, helper) {
		var aaa=event.getParam('account');
        var ac=component.get("v.accList");
        ac.push(aaa);
        component.set("v.data",ac);
	},
    tab : function(component, event, helper) {
	 component.set('v.columns', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Phone', fieldName: 'Phone', type: 'text'},
            {label: 'Industry', fieldName: 'Industry', type: 'text'}
            
        ]);
	
	}
})