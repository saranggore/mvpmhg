import { LightningElement ,api} from 'lwc';

export default class C1 extends LightningElement {
    @api message
    closeit(){
        this.dispatchEvent(new CustomEvent('close',{detail:"I am jumbo!!!!!!"}));
    }
}