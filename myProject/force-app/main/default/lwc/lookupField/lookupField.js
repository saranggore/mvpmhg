import { LightningElement,wire,track} from 'lwc';
import getAccounts from'@salesforce/apex/accLookup.getAccounts';
export default class LookupField extends LightningElement {
    @track searchKey;
    accountId
    accName1;
    @wire (getAccounts,{strAccountName: '$searchKey'}) accounts;
    handleKeyChange(event){
      this.searchKey = event.target.value;
    }
    parentHandleAction(event){
      this.accountId =  event.target.dataset.value;
      this.accName1=event.target.dataset.label;
      console.log(this.accountId);
      console.log(this.accName1);
    }
   
}