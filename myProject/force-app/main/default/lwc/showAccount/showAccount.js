import { LightningElement,wire } from 'lwc';
import queryAccountsByRevenue from '@salesforce/apex/AccountListControllerLwc.queryAccountsByRevenue';
const column=[
                {

                label:'Name',
                fieldName:'Name',
                type:'text'
                },
                {

                    label:'Phone',
                    fieldName:'Name',
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

export default class ShowAccount extends LightningElement {
    columns;
    accRecords;
    @wire(queryAccountsByRevenue)accRecordss({data,error}){
        if(data){
            console.log(data);
            this.columns=column;
            this.accRecords=data;
        }
        else if(error){
            console.error(error);
        }
    }
}