import { LightningElement, wire ,api} from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import Name_field from '@salesforce/schema/Account.Name';
import Email_field from '@salesforce/schema/Account.Email__c';

export default class WireGetRecordAdaptor extends LightningElement {
    name
    email
    @api recordId
    //@wire(getRecord,{recordId:'$recordId',fields:[Name_field,Email_field]})
    @wire(getRecord,{recordId:'$recordId',layoutTypes:['Full'],modes:['View']})
    
    recordInfo({data}){
        if(data){
        console.log(data)
        //this.name = data.fields.Name.displayValue ? data.fields.Name.displayValue:data.fields.Name.value
        }
    }
}