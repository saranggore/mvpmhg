import { LightningElement,wire } from 'lwc';
import { getPicklistValues,getObjectInfo } from 'lightning/uiObjectInfoApi';
import Account_object from '@salesforce/schema/Account';
import INdustry_FIeld from '@salesforce/schema/Account.Industry';
export default class WireEx2PicklistValue extends LightningElement {

    @wire(getObjectInfo,{objectApiName:Account_object})objectInfo

    @wire(getPicklistValues,{recordTypeId:'$objectInfo.data.defaultRecordTypeId',fieldApiName:INdustry_FIeld})
    picFunction({data,error}){
        if(data)
        {
            console.log(data);
        }
        if(error){
            console.error(error);
        }
    }
}