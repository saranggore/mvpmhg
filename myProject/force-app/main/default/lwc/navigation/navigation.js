import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'
import {encodeDefaultFieldValues} from 'lightning/pageReferenceUtils'
export default class Navigation extends NavigationMixin (LightningElement) {

    handleclick(){
        this[NavigationMixin.Navigate]({
            type:'standard__namedPage',
            attributes:{
                pageName:'home'
            }
        })
    }
    handleclickNewREcord(){
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes:{
                objectApiName:'Contact',
                actionName:'new'
            }
        })
    }
    handleDefaultValues(){
        const defaultValue=encodeDefaultFieldValues({
            FirstName:'ZERO',
            LastName:'Hero'
        })
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes:{
                objectApiName:'Contact',
                actionName:'new'
            },
            state:{defaultFieldValues:defaultValue}
        })
    }
    handleListView(){
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes:{
                objectApiName:'Contact',
                actionName:'list'
            },
            state:{filterName:'Recent'}
        })
    }
    handleRecordView(){
        this[NavigationMixin.Navigate]({
            
            type:'standard__recordPage',
            attributes:{
                recordId:'0032v00003lpejtAAA',
                objectApiName:'Contact',
                actionName:'view'
            }
        })
    }
}