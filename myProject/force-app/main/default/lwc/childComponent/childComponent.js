import { LightningElement,api,track} from 'lwc';

export default class ChildComponent extends LightningElement {
   @api publicName;
   @api bullShowMe;
    @api handleCall(){
      alert('I am clicked');
      this.bullShowMe=true;
    }

}