import { LightningElement,api } from 'lwc';
import account_Name from '@salesforce/schema/Account.Name';
import account_Industry from '@salesforce/schema/Account.Industry';

export default class LightningRecordForm extends LightningElement {
    @api recordId;
    @api objectApiName;
    @api fields=[account_Name,account_Industry];
    handleSuccess(event){
        alert('record Saved Successfully')
    }
}