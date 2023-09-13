import { LightningElement } from 'lwc';
import ACcountOBJect from '@salesforce/schema/Account'
import Industry from '@salesforce/schema/Account.Industry'
import Rating from '@salesforce/schema/Account.Rating'
import Name from '@salesforce/schema/Account.Name'
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
export default class CreatingRec extends LightningElement {
    AccObject=ACcountOBJect;
    fieldName=[Name,Rating,Industry];
    handleSuccess(event){
       const showTot= new ShowToastEvent({
            title:"Record Created Successfully",
            messge:"Record ID is:"+ event.detail.id,
            variant:"success"
        })
        this.dispatchEvent(showTot);
    }
}