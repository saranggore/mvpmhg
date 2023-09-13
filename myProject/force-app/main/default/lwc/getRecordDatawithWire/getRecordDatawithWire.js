import { LightningElement,api,wire } from 'lwc';
import {getRecord} from 'lightning/uiRecordApi';
const  fields= ['Contact.Name','Contact.Phone','Contact.Email'];

export default class GetRecordDatawithWire extends LightningElement {
    @api recordId;
    @api records;
    @wire(getRecord,{recordId:'$recordId',fields:fields})recCollection({data,error}){
        if(data){
          this.records=data;
          console.log(data)
        }
        if(error){
            console.log('Error');
        }
    }

    get name(){

        return this.records.fields.Name.value;
        
        }
}