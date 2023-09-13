import {LightningElement,wire} from 'lwc';
import {getPicklistValuesByRecordType , getObjectInfo } from 'lightning/uiObjectInfoApi';
import Account_Object from '@salesforce/schema/Account'
export default class WirePicklistValueByREccordType extends LightningElement {
    industryOptions
    industryOptionss
    selectedRating
    selectedIndustry
    @wire(getObjectInfo,{objectApiName:Account_Object})
    objectInfo
    
    @wire(getPicklistValuesByRecordType,{objectApiName:Account_Object,
        recordTypeId:'$objectInfo.data.defaultRecordTypeId'})
    picklistValues({data,error}){
        if(data){
            this.industryOptions=this.PicklistValues(data.picklistFieldValues.Rating)
            this.industryOptionss=this.PicklistValues(data.picklistFieldValues.Industry)
            
        }
        if(error){
            console.error(error)
        }
   
}
PicklistValues(data){
    return data.values.map(item=>({"label":item.label,"value":item.value}))
}
handleChange(event){
    console.log(event.target.value)
}
}