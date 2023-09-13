import { LightningElement ,track } from "lwc";
export default class card extends LightningElement {
   fullname = "Salesforce Troop"
   @track title="salesforce developer"
     changeHandler(event){
       this.title=event.target.value
     }
}