({
            
    demo2 : function(component, event, helper) {
		var con=event.getParam("con");
        var contact=component.get("v.contact");
        contact.push(con);
        component.set("v.contact",contact);
	},
    
	demo : function(component, event, helper) {
		var columns=[
            {label:'Last Name', fieldName:'LastName', type:'text'},
            {label:'First Name',fieldName:'FirstName',type:'text'},
            {label:'Phone',     fieldName:'Phone',    type:'text'},
            {label:'title',     fieldName:'title',    type:'text'},
        ];
            component.set("v.fields",columns);
	},
})