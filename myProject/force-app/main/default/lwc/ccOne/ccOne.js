import { LightningElement } from 'lwc';

export default class CcOne extends LightningElement {
    handleSubtract(){
        this.dispatchEvent(new CustomEvent('subtract'));
    }
    handleAdd(){
        this.dispatchEvent(new CustomEvent('add'));
    }
    handleMultiply(event){
        const valueForMultiply=event.target.value;
        console.log(valueForMultiply);
        this.dispatchEvent(new CustomEvent('multiply',{detail:valueForMultiply}));
    }
}