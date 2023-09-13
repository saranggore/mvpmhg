import { LightningElement,wire,track } from 'lwc';
import giveFields from '@salesforce/apex/showFields.giveFields';
export default class ShowFieldData extends LightningElement {
    @track recValue=[];
    objName;
    objName2;
    handleChange(event){
     this.objName=event.target.value;
    }
    handleClick(event)
    {
        this.objName2=this.objName;
    }
        @wire(giveFields,{objSearch:'$objName2'})displaydata({data,error}){
            if(data)
            {
               // console.log(data);
                for(let key in data)
                {
                    this.recValue.push({key:key,value:data[key]});
                }
                console.log(this.recValue);
            }else if(error)
            {
                console.log(error);
            }
        
    }
   
}