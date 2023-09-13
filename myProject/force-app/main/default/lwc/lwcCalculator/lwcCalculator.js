import { LightningElement } from 'lwc';

export default class LwcCalculator extends LightningElement {
    firstNumber;
    secondNumber;
    result;
    handleFirst(event){
        this.firstNumber=event.target.value;
        console.log('firstNumber',this.firstNumber);
    }
    handleSecond(event){
        this.secondNumber=event.target.value;
        console.log('secondNumber',this.secondNumber);
    }
    addNumber(event){
        this.result=parseInt(this.firstNumber) + parseInt(this.secondNumber);
        console.log('result',this.result);
    }
    subtractNumber(event){
        this.result=parseInt(this.firstNumber) - parseInt(this.secondNumber);
        console.log('result',this.result);
    }
    multiplyNumber(event){
        this.result=parseInt(this.firstNumber) * parseInt(this.secondNumber);
        console.log('result',this.result);
    }
    
}