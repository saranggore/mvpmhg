import { LightningElement } from 'lwc';
import Account_Object from '@salesforce/schema/Account';
import Name_Field from '@salesforce/schema/Account.Name';
import Type_Object from '@salesforce/schema/Account.Type';
import Industry_Object from '@salesforce/schema/Account.Industry';

export default class ReditForm extends LightningElement {

    objectApiName=Account_Object;
    fields={Name:Name_Field,Type:Type_Object,Industry:Industry_Object}
}