import { LightningElement } from 'lwc';

export default class ChildToPArent extends LightningElement {
    handleChange(event){
        const demo=event.target.value;
        const demo2=new CustomEvent('firstevent',{detail:demo});
        this.dispatchEvent(demo2);
    }
}