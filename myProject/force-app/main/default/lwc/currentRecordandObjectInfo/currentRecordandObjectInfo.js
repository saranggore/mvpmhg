import { LightningElement,api } from 'lwc';
import USER_ID from '@salesforce/user/Id';
import ACCOUNT_OWNER from '@salesforce/schema/Account.Owner.Name';
export default class CurrentRecordandObjectInfo extends LightningElement {
    @api recordId;
    @api objectApiName;
    userId=USER_ID;
    accountOwner=ACCOUNT_OWNER;
}