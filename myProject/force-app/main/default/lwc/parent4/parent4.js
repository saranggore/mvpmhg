import { LightningElement,api } from 'lwc';

export default class Parent4 extends LightningElement {
    @api percentage=10;
    handle(event){
        this.percentage=event.target.value;
    }
    resetValue1(){
        this.template.querySelector('c-child4').resetValue();
    }
}