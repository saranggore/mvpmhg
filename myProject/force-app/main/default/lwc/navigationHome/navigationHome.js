import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'
import {encodeDefaultFieldValues} from 'lightning/pageReferenceUtils'
export default class NavigationHome extends NavigationMixin(LightningElement) {
    naviToHome(){
          this[NavigationMixin.Navigate]({
              type:'standard__namedPage',
              attributes:{
                  pageName:'chatter'
              }
          })
    }

    naviToContact(){
        const defaultValue=encodeDefaultFieldValues({
            FirstName:'Zero',
            LastName:'Hero'
        })
        this[NavigationMixin.Navigate]({

            type:'standard__objectPage',
            attributes:{
                objectApiName:'Contact',
                actionName:'new'
            },
            state:{
                     defaultFieldValues:defaultValue
            }
        })
    }

    naviToListVIew(){
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes:{
                objectApiName:'Contact',
                actionName:'list'
            },
            state:{
                filterName:'Recent'
            }
        })
    }
}