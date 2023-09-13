import { LightningElement,track } from 'lwc';
import contactData from '@salesforce/apex/contactData.contactDatas';
const column=[
                {label:"Id", fieldName:'Id'},
                {label:"Phone", fieldName:'Phone'},
             ];
export default class ImperativeCallback extends LightningElement {
    @track data=[];
    columns=column;
    connectedCallback(){
        contactData()
        .then(result=>{
         this.data=result;
        })
        .catch(error => {
            console.log('Error Occoured')
        })
    }
}