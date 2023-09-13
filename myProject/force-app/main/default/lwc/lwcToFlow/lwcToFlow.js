import { LightningElement,api } from 'lwc';
import {FlowAttributeChangeEvent} from 'lightning/flowSupport';

export default class LwcToFlow extends LightningElement {
    @api latitude;
    @api longitude;
    
    handleLatitude(event){
        if(event.target.name=='Latitude'){
             this.latitude=event.target.value;
        }
        if(event.target.name=='Longitude'){
            this.longitude=event.target.value;
        }
    console.log('Lat:',this.latitude);
    console.log('Lang:',this.longitude);

         ["latitude","longitude"].forEach((loc)=> 
          this.dispatchEvent(new FlowAttributeChangeEvent(loc, this[loc]))   
          );

    }
}