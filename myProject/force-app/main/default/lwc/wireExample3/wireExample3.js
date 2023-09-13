import { LightningElement,wire } from 'lwc';
import { getObjectInfos } from 'lightning/uiObjectInfoApi';
import Account_object from '@salesforce/schema/Account'
import Opportunity_object from '@salesforce/schema/Opportunity'
export default class WireExample3 extends LightningElement {
    objectInfos
objectApiNames=[Account_object,Opportunity_object];
    @wire(getObjectInfos,{objectApiName:'$objectApiNames'})
    objectInfoHandler({data,error}){
        if(data){
            console.log(data)
            this.objectInfos=data;
        }
        if(error){}
    }
}