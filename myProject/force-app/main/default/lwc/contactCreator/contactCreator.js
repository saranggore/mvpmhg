import { LightningElement } from 'lwc';
import FirstName from '@salesforce/schema/Contact.FirstName';
import LastName from '@salesforce/schema/Contact.LastName';
import Email from '@salesforce/schema/Contact.Email';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'

export default class ContactCreator extends LightningElement {
    fields=[FirstName, LastName, Email];
    handleSuccess(event){
        const toasMessage=new ShowToastEvent({
            title:'Record created Successfully',
            message:'Record Id id :'+event.detail.id,
            variant:'Success'
        })
        this.dispatchEvent(toasMessage);
    }
}