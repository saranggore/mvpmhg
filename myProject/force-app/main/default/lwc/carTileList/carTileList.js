import { LightningElement,wire } from 'lwc';
import carDetails from '@salesforce/apex/carController.carDetails';
import {publish,subscribe,MessageContext} from 'lightning/messageService';
import CAR_FILTERED_MESSAGE from '@salesforce/messageChannel/CarsFiltered__c';
import CAR_SELECTED_MESSAGE from '@salesforce/messageChannel/CarSelected__c';


export default class CarTileList extends LightningElement {

   cars;
   filters={};    
   carFilterSubscription;
   @wire(MessageContext)messageContext;

    @wire(carDetails,{filters:'$filters'})carHandle({data,error}){
        if(data){
            console.log('Data',data);
            this.cars=data;
        }
        if(error){
            console.log('Error',error)
        }
    }

    connectedCallback(){
        this.subscribeHandler();
    }

    subscribeHandler(){
      this.carFilterSubscription=  subscribe(this.messageContext, CAR_FILTERED_MESSAGE, (message)=>this.handleFiterChanges(message))
    }

    handleFiterChanges(message){
        console.log(message.filters);
        this.filters={...message.filters}
    }

    carSelectedByUser(event){
        console.log('Selected Car ID:',event.detail)
        publish(this.messageContext, CAR_SELECTED_MESSAGE, {carId:event.detail})
    }
}