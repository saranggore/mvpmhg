import { LightningElement,wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import Industry_field from '@salesforce/schema/Account.Industry';
import Account_Object from '@salesforce/schema/Account'
export default class WireExamplePicklistVAlues4 extends LightningElement {

    selectedIndustry = '';
    industryOptions=[]

    @wire(getObjectInfo,{objectApiName:Account_Object})
    objectInfo
    
    @wire(getPicklistValues,{recordTypeId:'$objectInfo.data.defaultRecordTypeId', fieldApiName:Industry_field})
    picklistValues({data,error}){
        if(data){
            console.log(data)
            this.industryOptions=[...this.generatePicklist(data)]
        }
       if(error){
           console.error(error)
       }
    }
 
    generatePicklist(data){
        return data.values.map(item=>({ label: item.label, value: item.value }))
    }
    handleChange(event) {
        this.selectedIndustry = event.detail.value;
    }
}