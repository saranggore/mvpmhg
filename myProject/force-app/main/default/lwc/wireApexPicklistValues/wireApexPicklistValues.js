import { LightningElement,wire } from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import findAccount from '@salesforce/apex/accountFromIndustry.findAccount';
import Account_object from '@salesforce/schema/Account';
import Industry_Field from '@salesforce/schema/Account.Industry';
export default class WireApexPicklistValues extends LightningElement {
indusValues=[];
selectedIndusrty;
showAccount;
display=true;
    @wire(getObjectInfo,{objectApiName:Account_object})objectInfoFetched;

    @wire(getPicklistValues,{recordTypeId:'$objectInfoFetched.data.defaultRecordTypeId', fieldApiName:Industry_Field})showPicklist({data,error}){
    if(data){
        console.log('Data-->',data);
        this.indusValues=data.values;
    }
    else{
        console.error('Error-->',Error);
    }
   }

   handleSelect(event){
    this.selectedIndusrty=event.target.value;
      console.log('Select Industry=',this.selectedIndusrty);
      
      findAccount({industry:this.selectedIndusrty}).then(result=>{
       
        this.showAccount=result;
        console.log('ShowAccount',this.showAccount);

        if( this.showAccount===''){
            this.display=false;
        }
        else{
            this.display=true;
        }
      }).catch(error=>{
        alert('error');
      })
   }
}