({
	search : function(component, event, helper) {
		var action=component.get("c.demo1");
        var Name=component.get("v.name")
        action.setParams({"dspName":Name});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                var result=response.getReturnValue();
                component.set("v.list",result);
            }
        });
        $A.enqueueAction(action);
	},
    task : function(component, event, helper) {
        var ctarget=event.currentTarget;
        var id_str=ctarget.dataset.value;
        console.log(id_str);
        var action=component.get("c.demo2");
        action.setParams({"taskName":id_str});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                var res=response.getReturnValue();
                console.log(res)
                component.set("v.tasklist",res);
            }
            
        });
        $A.enqueueAction(action);
        
    },
    task2 : function(component, event, helper){
        component.set('v.columns', [
            {label: 'Candidate Id', fieldName: 'Candidate_Id__c', type: 'url',typeAttributes: {label: { fieldName: 'Candidate_Id__c' }, target: 'https://mvpmgh-dev-ed.lightning.force.com/lightning/'}},
            {label: 'Candidate Name', fieldName: 'Candidate_Name__c', type: 'text'},
            {label: 'DSP ID', fieldName: 'DSP_ID__c', type: 'Id'},
            {label: 'Email', fieldName: 'Email__c', type: 'Email'},
            {label: 'Status', fieldName: 'Status__c', type: 'picklist',editable: true},
            {label: 'Sub-status', fieldName: 'Sub_Status__c ', type: 'picklist'},
        ]);
        var ctarget1=event.currentTarget;
        var id_str1=ctarget1.dataset.value;
        console.log(id_str1);
         var action=component.get("c.demo3");
        action.setParams({"candiName":id_str1});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                var res=response.getReturnValue();
                res.forEach(function(record){
                    record.Candidate_Id__c = 'https://mvpmgh-dev-ed.lightning.force.com/lightning/r/Candidate__c/'+record.Candidate_Id__c+'/view';
                });
                console.log(res)
                component.set("v.data",res);
            }
            
        });
        $A.enqueueAction(action);
 

    }
})