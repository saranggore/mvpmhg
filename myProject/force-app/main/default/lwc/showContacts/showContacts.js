import { LightningElement,wire,track } from 'lwc';
import relatedCon from '@salesforce/apex/RelatedContacts.showContacts';
export default class ShowContacts extends LightningElement {
    @track recordId;
    dispalydata;
    
    @wire(relatedCon,{keySearch:'$recordId'})showData({data,error}){
        if(data){
            console.log(data);
            this.dispalydata=data;
        }
        else if(error){
        console.error(error);
        }
    }
}