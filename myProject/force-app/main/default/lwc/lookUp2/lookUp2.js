import { LightningElement,wire,track } from 'lwc';
import getAccounts from '@salesforce/apex/accLookup.getAccounts'
export default class LookUp2 extends LightningElement {

    @track accName;
    @wire(getAccounts,{strAccountName:'$accName'})displayNAme

    handleChange(event){
        this.accName= event.target.value;
    }
}