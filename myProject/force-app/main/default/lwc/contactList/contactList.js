import { LightningElement,wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';
import FirstName from '@salesforce/schema/Contact.FirstName';
import Email from '@salesforce/schema/Contact.Email';
import LastName from '@salesforce/schema/Contact.LastName';
import { reduceErrors } from 'c/ldsUtils';
const COLUMNS = [
   
    { label: 'First Name', fieldName: FirstName.fieldApiName },
    { label: 'Last Name', fieldName: LastName.fieldApiName },
    { label: 'Email', fieldName: Email.fieldApiName },
];

export default class ContactList extends LightningElement {
    
    columns = COLUMNS;
    @wire(getContacts)contactsREcieved
    get errors() {
        return (this.contactsREcieved.error) ?
            reduceErrors(this.contactsREcieved.error) : [];
    }

}