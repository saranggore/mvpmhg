({
	show : function(component, event, helper) {
        var actions=[
            {label:"view",name:"view",iconName:"action:preview"},
            {label:"edit",name:"edit",iconName:"action:edit"},
            {label:"delete",name:"delete",iconName:"action:delete"}
        ];
        component.set('v.columns', [
            {label: 'Opportunity name', fieldName: 'Name', type: 'text'},
            {label: 'Stage', fieldName: 'StageName', type: 'text'},
            {label: 'Close date', fieldName: 'closeDate', type: 'date'},
            {type:"action",typeAttributes:{rowActions:actions}}
        ]);
            
            var action=component.get("c.Demo1");
            action.setCallback(this,function(response){
            var state=response.getState();
            if(state ==="SUCCESS")
            {
            var result=response.getReturnValue();
            console.log('===='+result)
            component.set("v.data",result);
            }
            });
	$A.enqueueAction(action);
            },
    invoke  : function(component, event, helper) {
        var selectedRows=event.getParam("selectedRows");
        console.log(selectedRows);
        console.log(selectedRows.length);
    },
    callMe : function(component,event,helper)
    {
        var rowSelected=event.getParam("row");
        console.log(rowSelected.Id);
        var actionData=event.getParam("action");
        console.log(actionData.name);
        var evt=$A.get("e.c:dataTable_event");
       
        evt.setParams({"recId":rowSelected.Id,"myMode":actionData.name});
        evt.fire();
        alert('event fired');
    }
})