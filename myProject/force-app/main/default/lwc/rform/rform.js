import { LightningElement } from 'lwc';
import Account_Object from '@salesforce/schema/Account';
import Name_Field from '@salesforce/schema/Account.Name';
import Type_Field from '@salesforce/schema/Account.Type';
import Industry_Field from '@salesforce/schema/Account.Industry';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class Rform extends LightningElement {

    objectApiName=Account_Object;
    fields=[Name_Field,Type_Field,Industry_Field];

    successHandler(){
      this.dispatchEvent(new ShowToastEvent({
        title :"Success",
        message:"Record Created",
        variant:"Success"
      }))
    }

}