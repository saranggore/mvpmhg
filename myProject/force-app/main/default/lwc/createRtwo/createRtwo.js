import { LightningElement } from 'lwc';
import Account_object from '@salesforce/schema/Account';
import Id_field from '@salesforce/schema/Account.Id';
import Name_field from '@salesforce/schema/Account.Name';
import { createRecord } from 'lightning/uiRecordApi';
import { updateRecord } from 'lightning/uiRecordApi';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class CreateRtwo extends LightningElement {
name;
recordId='0012v00003ZFNDnAAP';
    handleAccName(event){
      if(event.target.name === 'Name'){

         this.name=event.target.value;

         console.log('Name',this.name);

      }
    }

    createAcc(){

        const fields={};

        fields[Name_field.fieldApiName]=this.name;
        fields[Id_field.fieldApiName]=this.recordId;

        
        const recordInput={fields}   

        updateRecord(recordInput).then(result=>{

            this.dispatchEvent(
                new ShowToastEvent({
                    title:'Success',
                    message:'Created Successfully',
                    variant:'Success',
                }),
            )
        }).catch(error=>{
           console.log('Error')
            
        })  
    }

}