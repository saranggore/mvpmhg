import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class ToastDemo extends LightningElement {
    handleSuccess(){
        
            this.callme('Success!!!','Account  created','success')
           
    }

    handleError(){
        this.callme('Failure!!!','Account not created','Error')
       
    }
    handleInfo(){
        this.callme('Info!!!','Account Info','Info')
    }

    callme(title,message,variant){
        const event=new ShowToastEvent({
            title ,
            message,
            variant
        });
        this.dispatchEvent(event)
    }
    
}