({
	addition : function(component,event,helper) {
       var a=component.get("v.Avalue");
        var b=component.get("v.Bvalue");
        var c=parseInt(a) +parseInt(b);
        component.set("v.Cvalue",c);
	},
    multiplication:function(component,event,helper){
          var a=component.get("v.Avalue");
        var b=component.get("v.Bvalue");
        var c=a*b;
        component.set("v.Cvalue",c);
    }
})