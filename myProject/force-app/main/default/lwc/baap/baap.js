import { LightningElement } from 'lwc';

export default class Baap extends LightningElement {
    textmessage
    
    handleCLick(){
        
       this.textmessage='Jungle ka raja'
    }
}