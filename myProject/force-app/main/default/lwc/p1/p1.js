import { LightningElement } from 'lwc';

export default class P1 extends LightningElement {
    selected =false;
    message;
    selectMethod(){
        this.selected=true;
    }
    hidemodel(event){
this.message=event.detail
        this.selected=false;
    }
}