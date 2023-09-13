import { LightningElement,api } from 'lwc';

export default class Childex1 extends LightningElement {
    @api name;

    @api nameChanged(){
        console.log('I am salesforce developer');
        this.name='Sarika';
    }

    handleClick(){
        this.dispatchEvent(new CustomEvent('close',{detail:{msg:'My name is mayur'}}))
    }
}