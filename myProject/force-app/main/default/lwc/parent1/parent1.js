import { LightningElement } from 'lwc';

export default class Parent1 extends LightningElement {
    message;
    handleCustomEvent(event){
        this.message=event.detail;
    }
    
}