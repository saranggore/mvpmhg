import { LightningElement,track } from 'lwc';

export default class ParentCompEvent extends LightningElement {
   @track message;
   receiveMessage(event){
    this.message=event.detail;
   }
}