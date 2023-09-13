({
	save : function(component, event, helper) {
	var comment1=component.get("v.com");
        console.log('Coment---->'+comment1);
    var recid=component.get("v.recordId");
        console.log('Id='+recid);
        
    var action=component.get("c.createcom");
        action.setParams({'caseId':recid,'commentInsert':comment1,'stage':component.get("v.selectedValue")});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==="SUCCESS")
            {
                console.log('Comment added');
                var dismissActionPanel = $A.get("e.force:closeQuickAction");
                dismissActionPanel.fire();
                $A.get("e.force:refreshView").fire();
            }
            else if(state == "ERROR")
            {
                //var errors = response.getError();                       
                component.set("v.showErrors",true);
                component.set("v.errorMessage",'PLease enter other stage');
                           
            }
        });
        $A.enqueueAction(action);
	},
    doit : function(component, event, helper) {
        var recid1=component.get("v.recordId");
        var action=component.get("c.recordtypeget");
        action.setParams({'reco':recid1});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==="SUCCESS")
            {
                var staList=response.getReturnValue();
                console.log('Stages---->'+staList);
                component.set("v.StagePicklist",staList);
            }
        });
        $A.enqueueAction(action);
    },
    showField : function(component, event, helper) {
        var inputselected=component.get("v.selectedValue");
        console.log('Selected picklist:::'+inputselected);
        if(inputselected=='Email')
        {
            component.set("v.showEmail",true);
            var res=component.get("v.showEmail");
            console.log('Selected picklist:::'+res);
        }
        else{component.set("v.showEmail",false);
            }
    }
	
})