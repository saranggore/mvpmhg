import { LightningElement,wire } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import Account_object from '@salesforce/schema/Account';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class CreateRecordWithWIre extends LightningElement {
     formFields={}
    changeHandler(event){
        const {name, value} = event.target;
         this.formFields[name]=value;
        // console.log(formFields)
    }

    saveRecord(){
        console.log('I am pressed')
        const recordInput ={apiName:Account_object.objectApiName,fields:this.formFields}
        createRecord(recordInput).then(result=>{
           
          this.showToast('Success',`Account Created Record is ${result.id}`)
          
        }).catch(error=>{
            this.showToast('Error creating record',Error.body.message,'error')
        })
    }
    showToast(title,message,variant){
        this.dispatchEvent(new ShowToastEvent({
            title,
            message,
            variant:variant || 'success'
        }))
    }
}