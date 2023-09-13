import { LightningElement,wire } from 'lwc';
import { getObjectInfo,getPicklistValues } from 'lightning/uiObjectInfoApi';
import CAR_Object from '@salesforce/schema/Car__c';
import CATEGORY_FIELD from '@salesforce/schema/Car__c.Category__c';
import MAKE_FIELD from '@salesforce/schema/Car__c.Make__c';
import {publish,MessageContext} from 'lightning/messageService';
import CAR_FILTERED_MESSAGE from '@salesforce/messageChannel/CarsFiltered__c';

export default class CarFilter extends LightningElement {
    filters={
        searchKey:'',
        maxPrice:999999
    }
    timer;
    @wire(MessageContext)messageContext;

    @wire(getObjectInfo,{objectApiName:CAR_Object})carObjectInfo

    @wire(getPicklistValues,{
        recordTypeId:'$carObjectInfo.data.defaultRecordTypeId',
        fieldApiName:CATEGORY_FIELD
    })categories

    @wire(getPicklistValues,{
        recordTypeId:'$carObjectInfo.data.defaultRecordTypeId',
        fieldApiName:MAKE_FIELD
    })makeType
   


    handleSearchKeyChange(event){
        console.log(event.target.value)
        this.filters={...this.filters,"searchKey":event.target.value}
        this.sendDataToCarList();
    }

    handleMaxPriceChange(event){
        console.log(event.target.value)
        this.filters={...this.filters,"maxPrice":event.target.value}
        this.sendDataToCarList();
    }

    handleCheckbox(event){
        if(!this.filters.categories){
            const categories=this.categories.data.values.map(item=>item.value)
            const makeType=this.makeType.data.values.map(item=>item.value)
            this.filters = {...this.filters, categories, makeType}
        }
        const {name, value}=event.target.dataset
        console.log('name',name);
        console.log('value',value);
        if(event.target.checked){
            if(!this.filters[name].includes(value)){
                this.filters[name]=[...this.filters[name],value]
            }}
            else{
                this.filters[name]=this.filters[name].filter(item=>item !== value)
            }
        
        this.sendDataToCarList();
    }

    sendDataToCarList(){
        window.clearTimeout(this.timer);
        this.timer=window.setTimeout(()=>{
            publish(this.messageContext,CAR_FILTERED_MESSAGE,{filters:this.filters})

        },4000)
    }
}