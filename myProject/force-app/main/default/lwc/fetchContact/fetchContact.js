import {LightningElement,wire,track} from 'lwc';
import getAllContacts from '@salesforce/apex/ContactManager.getContact';

export default class FetchContact extends LightningElement {
    @track count;
    countChange(event){
        this.count=event.target.value;
    }
    @wire(getAllContacts,{con:'$count'}) contacts;
   
}