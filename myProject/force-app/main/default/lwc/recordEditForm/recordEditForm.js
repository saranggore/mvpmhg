import { LightningElement } from 'lwc';
import Account_object from '@salesforce/schema/Account';
import Account_Name from '@salesforce/schema/Account.Name';
import Account_Industry from '@salesforce/schema/Account.Industry';
import Account_Region from '@salesforce/schema/Account.BillingCountry';
export default class RecordEditForm extends LightningElement {
    objectName=Account_object;
    Fields=[Account_Name,Account_Industry,Account_Region];
}