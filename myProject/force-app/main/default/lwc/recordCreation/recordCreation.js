import { LightningElement } from 'lwc';
import accName from '@salesforce/schema/Account.Name';
import Type from '@salesforce/schema/Account.Type';
import Industry from '@salesforce/schema/Account.Industry';
import Phone from '@salesforce/schema/Account.Phone';

import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class RecordCreation extends LightningElement {
    field=[accName,Type,Industry,Phone];
    handleSuccess(event){
     const evet=new ShowToastEvent({
         title:"Account created sussfully",
         message:"Record Id:"+event.detail.id,
         variant:"Success"
     })
     this.dispatchEvent(evet)
    }
}