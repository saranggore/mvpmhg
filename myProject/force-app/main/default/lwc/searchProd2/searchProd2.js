import { LightningElement,track } from 'lwc';
const columns = [
    {
        label: 'Product Name',
        fieldName: 'Product2.Name',
        type: 'url',
        typeAttributes: {label: { fieldName: 'Product2.Name' }, target: '_blank'}
    }, {
        label: 'Product Code',
        fieldName: 'Product2.ProductCode',
        type: 'text',
    }, {
        label: 'List Price',
        fieldName: 'UnitPrice',
        type: 'text',
    }, 
    {
        label: 'Product Description',
        fieldName: 'Product2.Description',
        type: 'text',
    }, 
    {
        label: 'Product Family',
        fieldName: 'Product2.Family',
        type: 'text',
    }, 
    ];
export default class SearchProd2 extends LightningElement {
    @track columns = columns;
    @track dispData;
    handlevalue(event){
        this.dispData=event.detail;
    }
}