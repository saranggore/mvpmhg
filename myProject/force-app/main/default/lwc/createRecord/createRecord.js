import { LightningElement } from 'lwc';

export default class CreateRecord extends LightningElement {
    name='';
    handleChange(event){
      this.name=event.target.value;
      console.log("Name is ",this.name);
    }
}