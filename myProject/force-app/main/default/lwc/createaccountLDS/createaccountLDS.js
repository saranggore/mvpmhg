import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class CreateaccountLDS extends LightningElement {

    name;
    type;
    industry;
    fields={}
    handleEvent(event){
        const {name,value}=event.target;
        this.fields[name]=value;
    }

    createAccount(){
     let createInput={apiName:ACCOUNT_OBJECT.objectApiName,fields:this.fields}
     createRecord(createInput).then(result=>{
        console.log(result.Id);
     }).catch(error=>{
        console.log('Error',error)
     })

    }
}