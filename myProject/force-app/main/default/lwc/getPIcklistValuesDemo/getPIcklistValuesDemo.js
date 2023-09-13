import { LightningElement,wire } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
export default class GetPIcklistValuesDemo extends LightningElement {
    picklistValue
@wire(getObjectInfo,{objectApiName:ACCOUNT_OBJECT})
objectInfo

@wire(getPicklistValues,{recordTypeId:'$objectInfo.data.defaultRecordTypeId',
                        fieldApiName:INDUSTRY_FIELD})
IndustryPicklistValues

handleChange(event){
    this.picklistValues=event.target.value;
}
}