import { LightningElement,api } from 'lwc';

export default class Child4 extends LightningElement {
    @api message;

    @api resetValue(){
        this.message=0;
    }
}