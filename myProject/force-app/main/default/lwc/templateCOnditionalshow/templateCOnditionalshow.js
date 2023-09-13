import { LightningElement } from 'lwc';

export default class TemplateCOnditionalshow extends LightningElement {
    inputtext=null;
    get checktext(){
        return this.inputtext === "troops";
    }
    changeHandler(event){
        this.inputtext=event.target.value;
    }
}