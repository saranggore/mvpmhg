import { LightningElement,api } from 'lwc';

export default class Parent2 extends LightningElement {
    demo1=['Mayur','Sandeep','Amar','Sujeet'];
    @api valueToSend=10
    percentage(event){
        this.valueToSend=event.target.value;
    }
}