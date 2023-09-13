import { LightningElement,wire } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Car__c.Name';
import PICTURE_URL_FIELD from '@salesforce/schema/Car__c.Picture_URL__c';
import CATEGORY_FIELD from '@salesforce/schema/Car__c.Category__c';
import MAKE_FIELD from '@salesforce/schema/Car__c.Make__c';
import MSRP_FIELD from '@salesforce/schema/Car__c.MSRP__c';
import FUEL_FIELD from '@salesforce/schema/Car__c.Fuel_Type__c';
import SEAT_FIELD from '@salesforce/schema/Car__c.seats_c__c';
import CONTROL_FIELD from '@salesforce/schema/Car__c.Control__c';
import { getFieldValue } from 'lightning/uiRecordApi';
import {subscribe,MessageContext,unsubscribe} from 'lightning/messageService';
import CAR_SELECTED_MESSAGE from '@salesforce/messageChannel/CarSelected__c';



export default class CarCard extends LightningElement {
    nameField=NAME_FIELD;
    pictureField=PICTURE_URL_FIELD;
    categoryField=CATEGORY_FIELD;
    makeField=MAKE_FIELD;
    msrpField=MSRP_FIELD;
    fuelField=FUEL_FIELD;
    seatField=SEAT_FIELD;
    controlField=CONTROL_FIELD;
    recordId;
    carSelectedSubscription;
    carName;
    carPicturerl;

    @wire(MessageContext)messageContext;


    handleRecordLoaded(event){
        const {records}=event.detail;
        const recordData=records[this.recordId];
        this.carName=getFieldValue(recordData,NAME_FIELD)
        this.carPicturerl=getFieldValue(recordData,PICTURE_URL_FIELD)
        // console.log('Name',this.carName);
         //console.log('URL',this.carPicturerl);
    }

    connectedCallback(){
        this.subscribeHandler();
        console.log('In connectedCallabck');
    }

    subscribeHandler(){
        console.log('In subscribeHandler');

        this.carSelectedSubscription= subscribe(this.messageContext, CAR_SELECTED_MESSAGE, (message)=>this.handleselected(message))
       console.log('Subscribe',this.carSelectedSubscription);
    }

    handleselected(message){
        console.log('In handler');

        this.recordId=message.carId;

        console.log('RecordId',this.recordId);
    }

    disconnectedCallabck(){
        unscbscribe(this.carSelectedSubscription)
        this.carSelectedSubscription=null;
    }
}