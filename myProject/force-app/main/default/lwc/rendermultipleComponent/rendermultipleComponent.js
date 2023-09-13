import { LightningElement } from 'lwc';
import signinTemplate from './signinTemplate.html'
import signupTemplate from './signupTemplate.html'
import defaultTemplate from './rendermultipleComponent.html'
export default class RendermultipleComponent extends LightningElement {
    selected=null;
    render(){
        return this.selected=== "Sign Up" ? signupTemplate :
        this.selected ==="Sign In" ? signinTemplate: defaultTemplate
    }
    HandlerClick(event){
        this.selected=event.target.label
    }
    submitHandler(event){
        if(event.target.label==='Sign In'){
            console.log("Sign In successfully")

        }else if(event.target.label==='Sign Up'){
            console.log("Sign Up successfully")
        }
    }
}