import { LightningElement,track } from 'lwc';
import {createMessageContext,publishMethod, subscribe,unsubscribe} from 'lightning/messageService';
import SAMPLEMC from "@salesforce/messageChannel/MyMessageChannel__c";

export default class LmsExample extends LightningElement {
    subscription;
    context=createMessageContext;
    @track myMessage='';
    hancleChnage(event){
     this.myMessage=event.target.value;
    }

    clicked(){
     const message={messageToSend:this.myMessage,sourceSystem:"From LWC"}
     publishMethod(this.context,SAMPLEMC,message);
    }
    subscribeMC(){
        this.subscription=  subscribe(this.context,SAMPLEMC,message);
        
    }
    UnsubscribeMC(){
        unsubscribe(this.subscription);
    }
}