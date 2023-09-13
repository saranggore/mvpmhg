import { LightningElement,wire } from 'lwc';
import getContactList  from '@salesforce/apex/fetCon.getcontacts'
const columns = [
    {label:'First Name', fieldName:'FirstName', editable:true},
    { label: 'Last Name', fieldName: 'LastName', editable: true },
    { label: 'Email', fieldName: 'Email', type:'email' },
    { label: 'Phone', fieldName: 'Phone', type:'Phone' }
]
export default class FetchingContact extends LightningElement {
    columns = columns
    draftValues = []
    @wire(getContactList)
    contact;
}