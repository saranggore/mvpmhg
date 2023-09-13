import { LightningElement,api,wire } from 'lwc';
import { getRecord,getFieldDisplayValue,getFieldValue } from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
export default class ShowRecordData extends LightningElement {
    @api recordId;
    name;
    Industry;
    @wire(getRecord,{recordId:'$recordId',fields:[NAME_FIELD,INDUSTRY_FIELD]})showdata({data,error}){
        if(data){
         console.log('Fetched Data',data); 
         console.log('Fetched Name',getFieldValue(data,NAME_FIELD));  
        this.name=getFieldValue(data,NAME_FIELD);
        this.Industry=getFieldDisplayValue(data,INDUSTRY_FIELD);
        }
        if(error){
            console.log(error);
        }
    }
}