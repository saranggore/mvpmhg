({
	callServerMethod : function(component) {
		alert('From helper Method');
        //1.Get reference to server-side method
        //Using component.get() function
        //arguments taken: server-side method name using c notation
        var methodRef=component.get("c.retContacts");
         alert(methodRef);
        //2.Register callback function which will get invoked
        //automatically once we receive response from server
       methodRef.setCallback(this,function(response) {
            //3.Check response state and take action accordingly
            var responseState=response.getState();
          
            alert(responseState);
            if(responseState=="SUCCESS"){
                //4.Get return value from response
                var result=response.getReturnValue();
                component.set("v.contactList",result);
                alert(result);
            }
            else {
                alert("Problem on server side...");
            }                      
            
        });
         $A.enqueueAction(methodRef);
	}
})