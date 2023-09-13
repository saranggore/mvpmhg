import { LightningElement } from 'lwc';

export default class Teat1 extends LightningElement {
    name="Mayur Gore";
    collegeName="GECA";
    get college(){
      const col=this.collegeName;
        return col.toLowerCase();
    }
}