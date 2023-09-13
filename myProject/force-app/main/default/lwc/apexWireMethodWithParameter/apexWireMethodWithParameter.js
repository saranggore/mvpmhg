import { LightningElement,wire,track,api } from 'lwc';
import findContact from '@salesforce/apex/wireExample.findContact';

export default class ApexWireMethodWithParameter extends LightningElement {
    @api searchKey;
    handleChange(event){
        this.searchKey=event.target.value;
        console.log(searchKey);
    }
    @wire(findContact,{name:'$searchKey'})recCollection;
}