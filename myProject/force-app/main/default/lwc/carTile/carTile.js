import { LightningElement,api } from 'lwc';

export default class CarTile extends LightningElement {
    @api car={}

    handleClick(){
        console.log('CAR',this.car)
        this.dispatchEvent(new CustomEvent('carselected',{detail:this.car.Id}))

    }
}