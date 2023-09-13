import { LightningElement } from 'lwc';
import Account_object from '@salesforce/schema/Account';
import Name_field from '@salesforce/schema/Account.Name';
import Type_field from '@salesforce/schema/Account.Type';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class AccountCreation extends LightningElement {
    name;
    type;

    handleAccName(event) {
        if (event.target.name === 'Name') {

            this.name = event.target.value;
        }
        else if (event.target.name === 'Type') {

            this.type = event.target.value;
        }

    }
    createAccountOnClick() {
        const fields = {};
        fields[Name_field.fieldApiName] = this.name;
        fields[Type_field.fieldApiName] = this.type;
        const recordInput = { apiName: Account_object.objectApiName, fields }

        createRecord(recordInput).then(result => {

            this.dispatchEvent(

                new ShowToastEvent({
                    title: 'success',
                    message: 'Account Created Successfully',
                    variant: 'Success'
                }),
            );
        }).catch(error => {
            console.error('Error');

        })
    }
}