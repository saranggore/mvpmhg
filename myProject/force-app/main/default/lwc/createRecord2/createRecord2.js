import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
export default class CreateRecord2 extends LightningElement {
    name ;
    phone ;
    email ;
    
    callName(event){
        this.name=event.target.value
    }
    callPhone(event){
        this.phone=event.target.value
    }
    callEmail(event){
        this.email=event.target.value
    }
     createACcount(){
        var fields = {'Name':this.name,'Phone':this.phone,'Email__c':this.email} ;
    
        var createRec={apiName:'Account',fields}
        createRecord(createRec).then(response=>{
            alert(' Account Created:'+response.id)
        }).catch(error=>{
            alert('Error'+JSON.stringify(error))
        })
    }
}