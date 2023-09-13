import { LightningElement,wire } from 'lwc';
import queryAccountsByRevenue from '@salesforce/apex/AccountListControllerLwc.queryAccountsByRevenue';
const DELAY = 300;
const column=[
    {

    label:'Name',
    fieldName:'Name',
    type:'text'
    },
    {

        label:'Phone',
        fieldName:'Phone',
        type:'Phone'
    },
    {

    label:'Email',
    fieldName:'Email__c',
    type:'Email'
    },
    {

    label:'Type',
    fieldName:'Type',
    type:'Picklist'
    }

]
export default class SearchACcountByText extends LightningElement {
    searchKey = '';
    columns;
    accRecords;
    @wire(queryAccountsByRevenue,{searchKey: '$searchKey'})accRecordss({data,error}){
        if(data){
            console.log(data);
            this.columns=column;
            this.accRecords=data;
        }
        else if(error){
            console.error(error);
        }
    }

    seachAccount(event){
        window.clearTimeout(this.delayTimeout);
        const searchKey = event.target.value;
        this.delayTimeout = setTimeout(() => {
            this.searchKey = searchKey;
        }, DELAY);
    }
}