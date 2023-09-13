import { LightningElement,track } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import Account_object from '@salesforce/schema/Account';
import Contact_object from '@salesforce/schema/Contact';
import Account_Name from '@salesforce/schema/Account.Name';
import Account_Id from '@salesforce/schema/Contact.AccountId';
import Contact_Name from '@salesforce/schema/Contact.LastName';
const DELAY = 300;
export default class CreateAccountConactForm extends LightningElement {

    AccountName;
    ContactName;
    
    @track AccountId;
    handlevalue(event){
        if(event.target.name ==="Aname")
        {
            this.AccountName= event.target.value;
        }
        if(event.target.name=== "Cname")
        {
            this.ContactName= event.target.value;
            console.log(this.ContactName);
        }
    }
    handleSave(event){
    const fields={};
    const confields={};

    fields[Account_Name.fieldApiName]=this.AccountName;
    const recordInput={apiName:Account_object.objectApiName,fields:fields};
    createRecord(recordInput).then((record) => {
      this.AccountId=record.id;
      confields[Account_Id.fieldApiName]=this.AccountId;
      confields[Contact_Name.fieldApiName]=this.ContactName;
      const recordInput2={apiName:Contact_object.objectApiName,fields:confields};
        createRecord(recordInput2).then((record2) => {
            console.log(record2);
      });
      });


     
     
    
}
}