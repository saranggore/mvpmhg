import { LightningElement,wire } from 'lwc';
import showMap from '@salesforce/apex/MapInLwc.showMap';
export default class MapLwc extends LightningElement {
    returnMap;
    returnMapArray=[];
    handleSimpleMap(){
        showMap().then((result)=>{
           
            console.log('Result',result);
          this.returnMapArray=[];
          for(var key in result){
            this.returnMapArray.push({key:key,value:result[key]});
        }
        }).catch((error)=>{
            console.log(error);
        });
    }
    
}