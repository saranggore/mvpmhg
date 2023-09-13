import { LightningElement } from 'lwc';
import weatherDisplay from '@salesforce/apex/ShowWeather.weatherDisplay';

export default class WeatherApi extends LightningElement {

    city;
    imageURL;
    condition;
    storecityName(event){
     this.city=event.target.value;
     console.log('City Name',this.city);
    }

    handleShow(){
        weatherDisplay({cityName:this.city}).then((result)=>{
            console.log('Data',result);
            if(result){
                let parceData=JSON.parse(result);
                this.imageURL=parceData.current.condition.icon;
                this.condition=parceData.current.condition.text;
            }
           
        }).catch((error)=>{
            this.condition = 'No matching location found.';
            console.log('###Error : ' + JSON.stringify(error));
        })
    }
}