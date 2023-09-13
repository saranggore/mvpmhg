import { LightningElement } from 'lwc';
import getaccList from '@salesforce/apex/accountData.getaccList'
export default class ApecImperatively extends LightningElement {
    hadleCli(){
        getaccList().then(result=>{
            console.log(result);
        })
    }
}