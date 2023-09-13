import { LightningElement,wire } from 'lwc';
import show from '@salesforce/apex/Showcontact.show';
export default class DisplayContact extends LightningElement {
   contactFetched;
    @wire(show)detailsList({data,error}){

        if(data){
           this.contactFetched=data;

        }
        if(error){

            console.log('Error')
        }
    }

}