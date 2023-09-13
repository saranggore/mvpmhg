import { LightningElement,wire } from 'lwc';
import {getRecord} from 'lightning/uiRecordApi'
import Id from '@salesforce/user/Id'
export default class WireExample extends LightningElement {
userId = Id
userdetail
@wire(getRecord, {recordId:'0052v00000dj1swAAA',fields:['user.Name','user.Email']})
userDetailHandler({data,error}){
    if(data){
        this.userdetail=data.fields
    }
    if(error){
        console.error(error)
    }
}
}