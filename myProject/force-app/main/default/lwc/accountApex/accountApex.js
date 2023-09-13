import { LightningElement,wire } from 'lwc';
import showAccount from '@salesforce/apex/passAccount.showAccount';

export default class AccountApex extends LightningElement {

    accountData;

    @wire(showAccount)showAccountsTo({data,error}){
        if(data){
            this.accountData=data;
            console.log('Data',this.accountData);
        }
        if(error){
            console.log('Error')
        }
    }
}