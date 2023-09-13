import { LightningElement,api } from 'lwc';

export default class ChildComp extends LightningElement {
    message;
    @api
    toUpper(strString){
        this.message=strString.toUpperCase();
    }
}