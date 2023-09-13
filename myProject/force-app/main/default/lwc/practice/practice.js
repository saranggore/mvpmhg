import { LightningElement } from 'lwc';

export default class Practice extends LightningElement {

    track='GB Classes';
    second='Best class In';

    handleChange(event){

      this.second=event.target.value;  
    }
}