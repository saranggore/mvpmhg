({
	callMe : function(component, event, helper) 
    {
	 var recId=event.getParam("recId");
     var myMode=event.getParam("myMode");
       
        component.set("v.flag",true);
        component.set("v.recId",recId);
        component.set("v.myMode",myMode);
    }
})