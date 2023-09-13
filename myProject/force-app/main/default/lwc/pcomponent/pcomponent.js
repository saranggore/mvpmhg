import { LightningElement } from 'lwc';

export default class Pcomponent extends LightningElement {
   
   showda=true;
   messa ='tested';
    messageFromChild(event){
     this.showda=false;

     this.messa=event.detail.msg;
    }

   
}