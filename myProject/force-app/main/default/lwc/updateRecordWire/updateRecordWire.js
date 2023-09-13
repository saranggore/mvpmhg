import { LightningElement,wire,api,track} from 'lwc';
import provideContact from '@salesforce/apex/contactFetching.provideContact';
import { updateRecord } from 'lightning/uiRecordApi';
import Contact_Id from '@salesforce/schema/Contact.Id';
import Contact_Name from '@salesforce/schema/Contact.Name';
import Contact_Email from '@salesforce/schema/Contact.Email';
export default class UpdateRecordWire extends LightningElement {
@track contacts;

Id='0032v00003q9WIzAAM';
Name;
Email;
    @wire(provideContact)showContact({data,error}){
        console.log('Data----->',data);
        this.contacts=data;
        console.log('Contacts----->',this.contacts);
    }
    handleChange(event){
    if(event.target.name ==="Id"){
        this.Id=event.target.value;
    }else if (event.target.name ==="Name"){
        this.Name=event.target.value;
    }else if (event.target.name ==="Email"){
        this.Email=event.target.value;
    }
    }
    
    updateRecord(){
        const fields = {};
        console.log('Clicked');
        console.log('Name',this.Name);
        fields[Contact_Id.fieldApiName] = this.Id;
        fields[Contact_Name.fieldApiName] = this.Name;
        fields[Contact_Email.fieldApiName] = this.Email;
        
        const recordInput = { fields: fields};
        console.log('recordInput',recordInput);
        updateRecord(recordInput).then((record) => {
            console.log(record);
          }).catch(error=>{
            console.error(error);
          });

    }
    
     
}