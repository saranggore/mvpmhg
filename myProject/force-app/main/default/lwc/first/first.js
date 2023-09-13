import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
export default class First extends LightningElement {

    handleClick(){
       // console.log('Toast Log');
        const evt= ShowToastEvent({
            title:"I am title",
            message:'I am message',
            variant:"Info"
        });
        this.dispatchEvent(evt);
    }
}