import { LightningElement ,api} from 'lwc';
import { updateRecord } from 'lightning/uiRecordApi';
import ACCOUNTOBJECT from '@salesforce/schema/Account';
import ID_FIELD from '@salesforce/schema/Account.Id';
import NAME_FIELD from '@salesforce/schema/Account.Name';
//import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class UpdateAccount extends LightningElement {
@api recordId;
name;
    handleName(event){
        this.name=event.target.value;
        console.log('Name:',this.name)
    }


    updateGivenRecord(){
        const fields={};
        fields[ID_FIELD.fieldApiName]=this.recordId;
        fields[NAME_FIELD.fieldApiName]=this.name;
        console.log('Name:',this.recordId)
        console.log('Name:',this.name)
        const recordInput={fields}
        console.log('recordInput:',recordInput)
        updateRecord(recordInput).then(()=>{
            console.log('Success')
        }).catch(error=>{
            console.log('Error')
        })
    }
}