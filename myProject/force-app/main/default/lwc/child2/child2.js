import { LightningElement } from 'lwc';

export default class Child2 extends LightningElement {
    handleChange(event){
        const demo=event.target.value;
        const demo2=new CustomEvent('first',{detail:demo});
        this.dispatchEvent(demo2);
    }
}