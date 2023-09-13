import { LightningElement ,track} from 'lwc';
import leadRecord from '@salesforce/apex/contactData.contactDatas';

const columns=[
    {label:'Id' , fieldName:'Id'},
    {label:'Name' , fieldName:'Name'},
    {label:'Email' , fieldName:'Email'}
]
export default class ShowLeadRecords extends LightningElement {
    @track columns=columns;
    @track data=[];
    connectedCallback(){
        leadRecord()
        .then(result =>{
            this.data=result;
        })
        .catch(error => {
            console.log('Error Occoured');
        })
    }
}