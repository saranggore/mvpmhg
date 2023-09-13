import { LightningElement } from 'lwc';
import Account_objectName from '@salesforce/schema/Account';
import Name_Field from '@salesforce/schema/Account.Name';
import Name_Phone from '@salesforce/schema/Account.Phone';
import Name_Amount from '@salesforce/schema/Account.Total_Amount__c';

export default class RecordEditFromDemo extends LightningElement {

    objectApiName=Account_objectName;
    fieldName=[Name_Field,Name_Phone,Name_Amount];

    handleSuccess(){
        console.log('Record Created Successfully');
    }
}