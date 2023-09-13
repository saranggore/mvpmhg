import { LightningElement } from 'lwc';

export default class SimpleIntresetCalculator extends LightningElement {
    principal;
    rate;
    time;
    simpleInterest;
    handlePrincipal(event){
        this.principal=parseInt(event.target.value);
    }
    handleRate(event){
        this.rate=parseInt(event.target.value);
    }
    handleTime(event){
        this.time=parseInt(event.target.value);
    }
    handleClick(){
this.simpleInterest='Simple Interest is :'+(this.principal*this.rate*this.time)/100;
    }
}