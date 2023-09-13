import { LightningElement,wire } from 'lwc';
import accountData from '@salesforce/apex/accountData.getaccountDatademo'
export default class ApexExample1 extends LightningElement {
    selectedtype=''
    @wire(accountData,{type:'$selectedtype'})
    filteredAccount
}