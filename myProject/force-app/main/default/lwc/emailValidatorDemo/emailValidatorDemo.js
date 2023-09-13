import { LightningElement } from 'lwc';
import {emailValidator} from 'c/emailValidator';
export default class EmailValidatorDemo extends LightningElement {
    validateEmail(){
        var input=this.template.querySelector(".input").value;
       var check= emailValidator(input);
       if(check){
        alert(input +'is valid email')
       }
       else{
        alert(input +'is not valid email')
       }
    }
}