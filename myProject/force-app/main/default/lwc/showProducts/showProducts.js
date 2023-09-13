import { LightningElement,wire,api,track} from 'lwc';
import opplineItems from '@salesforce/apex/showItems.retProducts';
import opplineItemsCount from '@salesforce/apex/showItems.getCount';
import pricebookData from '@salesforce/apex/showItems.retPricebook';
import deletProd from '@salesforce/apex/showItems.deletProd';
import {getRecord} from 'lightning/uiRecordApi';
import pricebooId from '@salesforce/schema/Opportunity.Pricebook2Id';
import { updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
import ID_FIELD from "@salesforce/schema/Opportunity.Id";
import Pricebook_FIELD from "@salesforce/schema/Opportunity.Pricebook2Id";
import { deleteRecord } from 'lightning/uiRecordApi';
//const fields = [pricebooId];
const columns = [
    { label: 'Product', fieldName: 'Name'},
    { label: 'Quantity', fieldName: 'Quantity', editable: true },
    { label: 'Sales Price', fieldName: 'UnitPrice', editable: true },
    { label: 'Date', fieldName: 'ServiceDate',type:'date', editable: true ,typeAttributes: {  
        day: 'numeric',  
        month: 'numeric',  
        year: 'numeric'} },
    { label: 'Line Description', fieldName: 'Description', editable: true },
   
];

export default class ShowProducts extends LightningElement {
    @api recordId;
    draftValues = [];
    @track dataTodisp;
    pbid;
    columns = columns;
    saveDraftValues = [];
    wiredRecords;
    dataLength;
    @track title;
    picklistOptions = [];
    selectedValue;
    @track pricebbokUpdateValue;
    @wire(getRecord,{recordId:'$recordId',fields:pricebooId})accountinfo({data,error}){
        if(data){
            console.log(data);
            this.pbid=data.fields.Pricebook2Id.value;
            console.log( this.pbid);
            
        }
    }
    
    @wire(opplineItems,{oppId:'$recordId'})showItems({data,error}){
       if(data){
       
        console.log(this.recordId);
        console.log(data);
        this.dataTodisp=data;
        this.dataLength=data.length;
            console.log('Length',this.dataLength);
            this.title=title + " " + (this.dataLength);
       }
       else{
        console.log(error);
        console.log(this.recordId);
       }
    }
    @wire(opplineItemsCount,{oppId:'$recordId'})showItemsCount({data,error}){
        if(data)
        {
            console.log(data);
            this.title ='Products'+ " " +'(' + data +')';
            console.log(title);
        }
        
    }
    
    handleSave(event) {
        console.log('recordInputs are');
        this.saveDraftValues = event.detail.draftValues;
        const recordInputs = this.saveDraftValues.slice().map(draft => {
            const fields = Object.assign({}, draft);
            return { fields };
        });
        console.log('recordInputs are',this.recordInputs);
        // Updateing the records using the UiRecordAPi
        const promises = recordInputs.map(recordInput => updateRecord(recordInput));
        Promise.all(promises).then(res => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Records Updated Successfully!!',
                    variant: 'success'
                })
            );
            this.saveDraftValues = [];
            this.isModalOpenEditButton=false;
            return this.refresh();
        }).catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error',
                    message: 'An Error Occured!!',
                    variant: 'error'
                })
            );
        }).finally(() => {
            this.saveDraftValues = [];
        });
    }

    // This function is used to refresh the table once data updated
    async refresh() {
        await refreshApex(this.dataTodisp);
    }
    
   @wire(pricebookData)retPricebbo({data,error}){

    if(data){
      this.picklistOptions=data.map(element=>{
        return {label:element.Name, 
                value:element.Id 
               }
      });
      console.log(this.picklistOptions);
    }
    if(error){
        console.log(error)
    }
   }

   handlePricebook(event){
     this.pricebbokUpdateValue=event.detail.value;
     console.log('New Pricebook Id',this.pricebbokUpdateValue);
   }

   updatePricebook(){
    
    deletProd({oppId:this.recordId})
            .then(result => {
                console.log('Deleted Record');
                this.deleteRecords();
            })
            .catch(error => {
                this.error = error;
            });
    
    
   
   }

   deleteRecords(){

    const fields = {};

    fields[ID_FIELD.fieldApiName] = this.recordId;
    fields[Pricebook_FIELD.fieldApiName] = this.pricebbokUpdateValue;

    const recordInput = {
        fields: fields
      };
      updateRecord(recordInput).then((record) => {
        console.log(record);
      });
   }
    @track isModalOpen = false;
    @track isSecondModalOpen=false;
    @track isModalOpenEditButton = false;
    @track isSortProducts=false;
    @track isopenChoosePricebook=false;
    openModal() {
        // to open modal set isModalOpen tarck value as true
        this.isModalOpen = true;
    }
    closeModal() {
        // to close modal set isModalOpen tarck value as false
        this.isModalOpen = false;
        this.isSecondModalOpen=false;
    }
    submitDetails() {
        // to close modal set isModalOpen tarck value as false
        //Add your code to call apex method or do some processing
        this.isModalOpen = false;
        this.isSecondModalOpen=true;
    }
    backbutton(){
        this.isModalOpen = true;
        this.isSecondModalOpen=false;
    }

    openModalEditProduct(){
     this.isModalOpenEditButton=true;
    }
    closeModalEditProduct() {
        // to close modal set isModalOpen tarck value as false
        this.isModalOpenEditButton=false;
    }
    SortProducts(){
        this.isSortProducts=true;
    }
    closeSortProducts() {
        // to close modal set isModalOpen tarck value as false
        this.isSortProducts=false;
    }
    openChoosePricebook(){
        this.isopenChoosePricebook=true;
    }
    closeChoosePricebook(){
        this.isopenChoosePricebook=false;
    }
}