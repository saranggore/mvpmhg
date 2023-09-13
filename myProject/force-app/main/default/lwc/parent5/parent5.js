import { LightningElement,track } from 'lwc';

export default class Parent5 extends LightningElement {
    @track gigen=5;
    handlechild(event){
        this.gigen=event.detail;
    }
}