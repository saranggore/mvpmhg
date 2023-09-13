import { LightningElement,wire } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import ACCOUNT_Object from '@salesforce/schema/Account';
export default class CreateRecordWire extends LightningElement {
   
    formFields={}
    changeHandler(event){
     const {name,value}=event.target;
     this.formFields[name]=value;
    }
    createAcc(){
        const recordInput={apiName:ACCOUNT_Object.objectApiName,fields:this.formFields}
        createRecord(recordInput).then(result=>{
            console.log('Record Created');
            alert('record created');
        }).catch(error=>{
            console.log('Error',error)
        })
    }
}