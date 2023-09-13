import { LightningElement,api } from 'lwc'; 
import {NavigationMixin} from 'lightning/navigation'

export default class NaviagateToRecord extends NavigationMixin(LightningElement) {
@api recordId ;
NewRecoed(){
    this[NavigationMixin.Navigate]({
        type: 'standard__recordPage',
        attributes: {
            recordId:'00O2v00000MSERqEAP',
            objectApiName: 'Report',
            actionName: 'view'
        }
    });
}

EditRecoed(){
    this[NavigationMixin.Navigate]({
        type:'standard__recordPage',
        attributes:{
            "recordId":this.recordId,
            "objectApiName":"Contact",
            "actionName":"edit"
        }
    });
}

RefreshRecoed(){
    this[NavigationMixin.Navigate]({
        type:'standard_recordPage',
        attributes:{
            "recordId":this.recordId,
            "objectApiName":"Contact",
            "actionName":"view"
        }
    });
}
navigateAccRecentView(){
    this[NavigationMixin.Navigate]({
        "type":"standard__objectPage",
        "attributes":{
            "objectApiName":"Account",
            "actionName":"list"
        },
        "state":{
            "filterName":"Recent"
        }
    });
 }
 navigateRelatedListView(){
     this[NavigationMixin.Navigate]({
         "type":"standard__recordRelationshipPage",
         "attributes":{
            recordId:this.recordId,
            objectApiName:'Account',
            relationshipApiName:'Contacts',
            actionName:'view'
         }
     });
 }
}