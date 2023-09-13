import { LightningElement,wire,track } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import getObjList from '@salesforce/apex/objectNames.getAllCustomSObjects';
export default class ObjectPicklist extends LightningElement {
   @track objectNameToGetFields ;
   @track mapData=[];
   @track objectName=[];
   @wire(getObjList)showData({data,error}){
        if(data){
            console.log('Data',this.data);
          var conts = data;
           for(const  key in data){
            const option ={label:data[key],value:key};
           this.mapData=[ ...this.mapData, option ];
           }
        }
        if(error){
            console.log('Error',error);
        }
    }
    @track lstFields =[];
    @wire(getObjectInfo, { objectApiName: '$objectNameToGetFields' })
    
    getObjectInfo({ error, data }) {
        if (data) {
            this.lstFields = [];
            for (let key in data.fields) {
                if (data.fields.hasOwnProperty(key)) {
                    this.lstFields.push({ value: key, label:key});
                }
            }
        }
        else if (error) {
            console.log('Error while get fields');
            this.lstFields = [];
        }
    }
    get options(){
        return this.mapData;

    }
    selectedObject(event){
       this.objectNameToGetFields=event.target.value;
    }
    handleChnage(event){
        console.log('Selected value is',event.target.value);
    }
    
}