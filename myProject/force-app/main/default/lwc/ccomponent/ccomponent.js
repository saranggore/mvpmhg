import { LightningElement,api } from 'lwc';

export default class Ccomponent extends LightningElement {
    @api message;
    display=true;

    @api showdata(){
     this.display=true;
    }

    handleCall(){
        this.dispatchEvent(new CustomEvent('sending',{detail:{msg:"Lest Try"}}));
    }
}