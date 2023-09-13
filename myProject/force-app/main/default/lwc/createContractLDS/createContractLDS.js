import { LightningElement,wire,track } from 'lwc';
import { createRecord,getRecord } from 'lightning/uiRecordApi';
const fieldArray=['Contact.LastName','Contact.Phone','Contact.Email'];
export default class CreateContractLDS extends LightningElement {
    name;
    phone;
    email;
    @track recordId;
    @wire(getRecord,{recordID:'$recordId',fields:fieldArray}) contactRecord;
    handleName(event){
        this.name=event.target.value;
    }
    handlePhone(event)
    {
        this.phone=event.target.value;
    }
    handleEmail(event){
        this.email=event.target.value;
     }

     createRecord(){
       const fields={LastName:this.name,Phone:this.phone,Email:this.email};
       const recordInput={apiName:'Contact',fields};
       createRecord(recordInput).then(response=>{
           this.recordId=response.id;
           console.log('Contact Has been created',response.id);
       }).catch(error=>{
           console.log('Error while creating contract',error.body.message);
       })
     }
     get retContactName(){
        console.log('COntact Phone1:')
         if(this.contactRecord.data){
             console.log('COntact Phone:',contactRecord.data.fields.Phone.value)
             return this.contactRecord.data.fields.Phone.value;
         }
         return undefined;
        }
}