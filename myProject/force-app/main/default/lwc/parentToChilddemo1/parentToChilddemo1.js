import { LightningElement } from 'lwc';

export default class ParentToChilddemo1 extends LightningElement {
    HandleChange(event){
        this.template.querySelector('c-child-comp').toUpper(event.target.value);
    }
}