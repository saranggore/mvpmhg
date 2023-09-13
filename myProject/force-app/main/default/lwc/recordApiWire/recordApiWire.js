import { LightningElement,wire,api } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import Name_field from '@salesforce/schema/Account.Name';
import AnnualRevenue_field from '@salesforce/schema/Account.AnnualRevenue';
import Owner_Name from '@salesforce/schema/Account.Owner.Name';
export default class RecordApiWire extends LightningElement {
    name
    AnnualRevenue
    ownerName
    @api recordId;
    
    @wire(getRecord,{recordId:'$recordId',fields:[Name_field,AnnualRevenue_field,Owner_Name]})
    recordInfo({data}){
        if(data){
            console.log(data);
            this.name=data.fields.Name.value;
            this.AnnualRevenue=data.fields.Name.value;
            this.ownerName = data.fields.owner.displayValue ? data.fields.owner.displayValue :data.fields.owner.value;
        }
    }
}