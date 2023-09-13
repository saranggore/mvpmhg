({
	init : function(component, event, helper) {
        component.set("v.column",[{label:'Name',fieldName:'Name',type:'string'},
                                  {label:'Email',fieldName:'Email__c',type:'string'},
                                  {label:'Phone',fieldName:'Phone',type:'Phone'},
                                 ])
	},
    show : function(component,event,helper){
    var action=component.get('c.demo1');  
    action.setCallback(this,function(response){
                                  var state=response.getState();
                                  if(state==='SUCCESS')
                                  {
                                  var ret=response.getReturnValue();
                                  component.set('v.data',ret);
                                  }
                                  });
                                  $A.enqueueAction(action);                              
    } ,
                                  updateselected: function(component,event,helper){
                                  var count=event.getParam('selectedRows');
                                  component.set('v.selectedRowsCount', count.length);
                                  
                                  }
                                                                
})