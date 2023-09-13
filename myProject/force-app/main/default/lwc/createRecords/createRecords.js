import { LightningElement } from 'lwc';
import {createRecord} from 'lightning/uiRecordApi';
import Account_object  from '@salesforce/schema/Account';
import Account_Name from '@salesforce/schema/Account.Name';
export default class CreateRecords extends LightningElement {
    name='';
    Id;
    handleChange(event){
      this.name=event.target.value;
      console.log("Name is ",this.name);
    }
    handleClick(){
     
      const fields={};
      fields[Account_Name.fieldApiName]=this.name;
      console.log("Name is ",fields);
      const recordInput = {apiName :Account_Name.objectApiName,fields};
       createRecord(recordInput)
       .then(account=>{
           console.log('Account',account)
           this.Id=account.id;
       })
       .catch(error=>{
           console.error('Error',error);
       })
    }
}