({
	show : function(component, event, helper) {
		var columns=[
            {label:'AccountName', fieldName:'Name',Type:'Text'},
            {label:'Phone', fieldName:'Phone',Type:'Text'},
            {label:'Industry', fieldName:'Industry',Type:'Text'},
            {label:'Rating', fieldName:'Rating',Type:'Text'},
        ];
            component.set("v.fields",columns);
            var acc=event.getParam("acc");
            var accounts=component.get("v.accounts");
            accounts.push(acc);
            component.set("v.accounts",accounts);
	},
       
            callMe:function(component,event,helper){
            
            }       
})