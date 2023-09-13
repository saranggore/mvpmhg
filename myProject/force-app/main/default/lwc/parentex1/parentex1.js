import { LightningElement,api } from 'lwc';

export default class Parentex1 extends LightningElement {
    @api message
    handleclick(){
        this.template.querySelector("c-childex1").nameChanged();
    }
    handleClose(event){
        this.message=event.detail.msg;
    }
}