import { LightningElement } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ACCOUNR_OBJ from '@salesforce/schema/Account';
import { createRecord } from 'lightning/uiRecordApi';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class AccountCreation2 extends LightningElement {
    name;
    type;
    industry;

    handleEvent(event){
        if(event.target.name=='Name'){
            this.name=event.target.value;
        }
        else if(event.target.name=='Type'){
            this.type=event.target.value;
        }
        else if(event.target.name=='Industry'){
            this.industry=event.target.value;
        }
    }

    createAccount(){
        let fields={}
        fields[NAME_FIELD.fieldApiName]=this.name;
        fields[TYPE_FIELD.fieldApiName]=this.type;
        fields[INDUSTRY_FIELD.fieldApiName]=this.industry;

        const recordInput={apiName:ACCOUNR_OBJ.objectApiName,fields:fields}
        
        createRecord(recordInput).then(result=>{
            console.log('Success')
            this.dispatchEvent(new ShowToastEvent({
                title:'Success',
                message:'Account created with Id'+result.id,
                variant:'Success'
            }));
            this.template.querySelector('form').reset(); 
        }).catch(error=>{
            console.log('Error')
        })
    }
}