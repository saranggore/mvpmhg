import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class ToastExample extends LightningElement {
 
    onclickHandle(){
        const evt=new ShowToastEvent({
            title:'Success',
            Message:'Record Saved Successfully',
            variant:"toast variant"
    
        });
        this.dispatchEvent(evt);
    }
}