import { LightningElement,wire } from 'lwc';
import MyMessageChannel from '@salesforce/messageChannel/MyMessageChannel__c';
import {subscribe,MessageContext} from 'lightning/messageService';

export default class ShowResult extends LightningElement {
    @wire(MessageContext)messageContext;
    counter=0;
    connectedCallback(){
        this.subscribeToMessageChannel();
    }
    subscribeToMessageChannel(){
        subscribe(this.messageContext,MyMessageChannel,(message)=>{
            return this.handleMessage(message);})
    }
    handleMessage(message){
         if(message.oprator=="Add"){
            this.counter=this.counter + message.constant;
         }
         if(message.oprator=="Subtract"){
            this.counter=this.counter - message.constant;
         }
         if(message.oprator=="multiply"){
            this.counter=this.counter * message.constant;
         }

    }
}