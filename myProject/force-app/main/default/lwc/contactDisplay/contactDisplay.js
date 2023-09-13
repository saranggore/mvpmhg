import { LightningElement,wire,track} from 'lwc';
import getContactsToDisplay from '@salesforce/apex/contactFetching.getContactsToDisplay';
import getAccountDIsplay from '@salesforce/apex/contactFetching.getAccountDIsplay';

export default class ContactDisplay extends LightningElement {
 
   
@wire(getContactsToDisplay,{nam:'Last Demo'})displayCon;

@wire(getAccountDIsplay)displayAccs;
}