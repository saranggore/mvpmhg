import { LightningElement,wire } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import Account_object from '@salesforce/schema/Account'
export default class WireExample2 extends LightningElement {
    defaultrecordType
    @wire(getObjectInfo,{objectApiName:Account_object})
    objectinfo({data,error}){
        if(data){
            console.log(data)
this.defaultrecordType=data.defaultRecordTypeId
        }
    }
}