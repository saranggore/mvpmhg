import { LightningElement,api } from 'lwc';

export default class NewCmp extends LightningElement {
    @api totalRevenue;
     typedText;
    handleChange(event){
      this.typedText=event.target.value;
    }
}