import { LightningElement } from 'lwc';

export default class PcOne extends LightningElement {
    counts=1;

    subtractt(){
        this.counts--;
    }
    addition(){
        this.counts++;
    }
    multiplication(event){
        const values=event.detail;
        console.log(values);
        this.counts *= values;
    }
}