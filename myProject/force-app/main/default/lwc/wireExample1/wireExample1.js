import { LightningElement,wire } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import Account_object from '@salesforce/schema/Account';
export default class WireExample1 extends LightningElement {
    @wire(getObjectInfo,{objectApiName:Account_object})
    objectInfo({data,error}){
        if(data){
            console.log(data);
        }
    }
}