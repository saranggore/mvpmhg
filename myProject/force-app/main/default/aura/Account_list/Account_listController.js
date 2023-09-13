({
	show : function(component, event, helper) {
		var acc=event.getParam("acc");
        var accounts=component.get("v.accounts");
        accounts.push(acc);
        component.set("v.accounts",accounts);
	},
    callMe:function(component,event,helper){
        var columns=[
            
            {label:'AccountName', fieldName:'Name', type:'text'},
            {label:'Phone', fieldName:'Phone', type:'text'},
            {label:'Industry', fieldName:'Industry' ,type:'text'},
            {label:'Rating', fieldName:'Rating' ,type:'text'},
        ];
            component.set("v.fields",columns);
    }
})