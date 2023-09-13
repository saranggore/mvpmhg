({
   init : function(component, event, helper) {
  var redirectToNewRecord = $A.get( "e.force:navigateToSObject" );
    redirectToNewRecord.setParams({"recordId":component.get('v.aura_id_assign'),"slideDevName": "detail"});
redirectToNewRecord.fire();
}
})