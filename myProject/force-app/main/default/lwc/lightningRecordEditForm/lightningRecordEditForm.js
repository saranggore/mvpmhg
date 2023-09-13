import { LightningElement } from 'lwc';
import Contact_obj from '@salesforce/schema/Contact';

import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import ACCOUNT_FIELD from '@salesforce/schema/Contact.AccountId';

export default class LightningRecordEditForm extends LightningElement {

    contactobj= Contact_obj;
  
            fields={ACCOUNT_FIELD,TITLE_FIELD,NAME_FIELD,PHONE_FIELD,EMAIL_FIELD,}

    handleclick(){
              const inputField= this.template.querySelectorAll('lightning-input-field');
              Array.from(inputField).forEach(element => {
                element.reset();
              });
                }
}