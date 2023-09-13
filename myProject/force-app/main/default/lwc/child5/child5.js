import { LightningElement,api } from 'lwc';

export default class Child5 extends LightningElement {
   @api progressValue
    handleChange(event){
      this.progressValue=event.target.value;

      this.dispatchEvent(new CustomEvent("progress",{detail:this.progressValue}))
    }
}