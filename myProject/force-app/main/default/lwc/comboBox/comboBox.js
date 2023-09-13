import { LightningElement } from 'lwc';

export default class ComboBox extends LightningElement {
    options=[
        {label:"Mayur", value:"MG"},
        {label:"Sandeep", value:"SM"},
        {label:"Sujeet", value:"SM"},
        {label:"Amar", value:"AM"},
    ];

    handleChange(event){
        alert('Selected value is:'+event.detail.label);
    }
}