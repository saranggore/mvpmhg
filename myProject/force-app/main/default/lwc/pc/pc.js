import { LightningElement } from 'lwc';

export default class Pc extends LightningElement {
    handleClick(){
        console.log('I am clicked');
        this.template.querySelector("c-child-component").handleCall();
    }
}