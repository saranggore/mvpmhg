import { LightningElement ,wire} from 'lwc';
import {getObjectInfo,getPicklistValues} from 'lightning/uiObjectInfoApi';
import Account_obj from '@salesforce/schema/Account';
import Industry_Field from '@salesforce/schema/Account.Industry';
export default class PicklistFetching extends LightningElement {

    @wire(getObjectInfo,{objectApiName:Account_obj})
    objectInfo
    options=[]
    @wire(getPicklistValues,{recordTypeId:'$objectInfo.data.defaultRecordTypeId',fieldApiName:Industry_Field})
    showPick({data,error}){
       if(data){
        console.log('Picklist Values',data);
        this.options=[...this.sendValues(data)];
       }
        if(error){
            console.log(error);
        }
      
   }
   sendValues(data){
    return data.values.map(item=>({label:item.label, value:item.value}))
   }
   handleChange(event){
    console.log(event.target.value);
   }
}