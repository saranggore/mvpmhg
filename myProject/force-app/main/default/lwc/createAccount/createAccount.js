import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import Acount_record from '@salesforce/schema/Account';
import NAME_FIELD from "@salesforce/schema/Account.Name";
export default class CreateAccount extends LightningElement {
    Name;
    
    saveName(event){
        if (event.target.name === "name") {
            this.Name = event.target.value;
        }
    }

    handleSave(){
    const fields={};
    fields[NAME_FIELD.fieldApiName]=this.Name;
    const recordInput={apiName:Acount_record.objectApiName,fields:fields};
    createRecord(recordInput).then((record) => {
        console.log(record);
      });

    }
}