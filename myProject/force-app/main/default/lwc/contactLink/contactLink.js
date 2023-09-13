import { LightningElement,wire,track } from 'lwc';
import contactReturn from '@salesforce/apex/contactController2.contactReturn';

export default class ContactLink extends LightningElement {
     columns = [
        { label: 'Id', fieldName: 'Id',type:'url',typeAttributes: {
            label: {
                fieldName: 'Id'
            }
        }},
        { label: 'Name', fieldName: 'Name',type:'text'}
    ];
    @track data1 = [];
   
@wire(contactReturn)contactListR({data,error}){
    if(data){
        this.data1=data;
        console.log(data);
    }
}

}