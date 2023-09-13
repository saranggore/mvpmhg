({
	add : function(component, event, helper) {
    var firstno=component.get("v.FirstNumber");
    var secondno=component.get("v.SecondNumber");
    var sum=parseInt(firstno) + parseInt(secondno);
    component.set("v.Result",sum);
	},
    sub : function(component, event, helper) {
    var firstno=component.get("v.FirstNumber");
    var secondno=component.get("v.SecondNumber");
    var sum=parseInt(firstno) - parseInt(secondno);
    component.set("v.Subtract",sum);
    },
     mul : function(component, event, helper) {
    var firstno=component.get("v.FirstNumber");
    var secondno=component.get("v.SecondNumber");
    var sum=parseInt(firstno) * parseInt(secondno);
    component.set("v.Multiplication",sum);
     },
     div : function(component, event, helper) {
    var firstno=component.get("v.FirstNumber");
    var secondno=component.get("v.SecondNumber");
    var sum=parseInt(firstno) / parseInt(secondno);
    component.set("v.Division",sum);
     },
})