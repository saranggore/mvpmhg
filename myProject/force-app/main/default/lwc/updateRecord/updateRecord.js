import { LightningElement,api,track } from 'lwc';
import { updateRecord } from 'lightning/uiRecordApi';
import COn_id from '@salesforce/schema/Contact.Id';
import Last_Name from '@salesforce/schema/Contact.LastName';
import Account_Name from '@salesforce/schema/Contact.AccountId';
import ReportsTo from '@salesforce/schema/Contact.ReportsToId';
import Amount from '@salesforce/schema/Contact.Amount__c';

export default class UpdateRecord extends LightningElement {
    @api recordId
    @track Amount2;
    LastName=Last_Name
    AccountName=Account_Name
    Reports_To=ReportsTo
    Amount_1=Amount
    Amount3
    fields=[Last_Name,Account_Name,ReportsTo,Amount];
    handleChange(event){
this.Amount3= event.target.value;
    }
    handleClick(){
     const fields={};
     fields[COn_id.fieldApiName]=this.recordId;
     fields[Amount.fieldApiName]=this.Amount3;
     const recordInput = { fields };
     updateRecord(recordInput).then(()=>{ this.dispatchEvent(
        new ShowToastEvent({
            title: 'Success',
            message: 'Case Updated',
            variant: 'success'
        })
        );
    }).catch(error => {
        console.log(error);
    });
}
}