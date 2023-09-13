import { LightningElement } from 'lwc';

export default class DataBindingExample extends LightningElement {
    message="World"
    HAndleChange(event){
        this.message=event.target.value;
    }
}