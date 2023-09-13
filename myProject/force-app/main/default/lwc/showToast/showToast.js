import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class ShowToast extends LightningElement {
    showError(){
const showIndo=new ShowToastEvent({
     title:'Error',
     message:'This is error message',
     variant:'warning'
});
this.dispatchEvent(showIndo);
    }
}