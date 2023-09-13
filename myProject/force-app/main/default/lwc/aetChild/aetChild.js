import { LightningElement,api } from 'lwc';

export default class AetChild extends LightningElement {
    @api 
    information
    get userdetail(){
        return information
    }

    set userdetail(data){
        let newAge=data.age*2
       this.information={...data,age:newAge}
    }
}