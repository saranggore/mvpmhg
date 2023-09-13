import { LightningElement } from 'lwc';

export default class IfTrue extends LightningElement {
    showtext=false;
    showcontent(){
        this.showtext=!this.showtext;
    }
}