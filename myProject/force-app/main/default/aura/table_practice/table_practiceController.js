({
	myAction : function(component, event, helper) {
        //creating Actions
        var actions=[
            {label:"view",name:"view",iconName:"action:preview"},
            {label:"delete",name:"delete",iconName:"action:delete"},
            {label:"edit",name:"edit",iconName:"action:edit"}
                      ];
        component.set('v.columns', [
            {label: 'Id', fieldName: 'Id', type: 'text'},
            {label: 'Account name', fieldName: 'Name', type: 'text'},
            {type:"action",typeAttributes:{rowActions:actions}}
            
        ]);
        
        
        var action=component.get("c.demo2");
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS')
            {
                var result=response.getReturnValue();
                component.set("v.data",result);
                
            }
        });
        $A.enqueueAction(action);
	},
    invoke : function(component, event, helper) {
    var selectedRecord=event.getParam("selectedRows");
      //  console.log(selectedRecord);
},
    call : function(component, event, helper) {
        var rowSelected=event.getParam("row");
        console.log(rowSelected.Id);
        var actionData=event.getParam("action");
        console.log(actionData.name);
    }
})