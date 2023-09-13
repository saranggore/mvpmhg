import { LightningElement,wire } from 'lwc';
import conList from '@salesforce/apex/ContactList.conList';

export default class FilteringContactData extends LightningElement {

theader=['Id','Name','Email'];
totalData=[];
filteredData=[];
searchc;
timer;
filterby='Name';
@wire(conList)showData({data,error}){
    if(data){
        console.log(data);
        this.totalData=data;
        this.filteredData=data;
        console.log('this.filteredData',this.filteredData);
    }
    if(error){
        console.error(error);
    }
}

   get filterbyOprionss(){
    return [
        {label:'All',value:'All'},
        {label:'Id',value:'Id'},
        {label:'Name',value:'Name'},
        {label:'Email',value:'Email'}
    ]
   }

   filterHandler(event){

    this.filterby=event.target.value;
   }

   searchContact(event){
     this.searchc=event.target.value;
     //console.log(this.searchc);
     if(this.searchContact){
        window.clearTimeout(this.timer)
        this.timer=window.setTimeout(()=>{
            console.log(this.searchc);
            if(this.filterby=='All'){
                this.filteredData=this.totalData.filter(eachObj=>{
                    return Object.keys(eachObj).some(key=>{
                        return eachObj[key].toLowerCase().includes(this.searchc)
                    })
                 })
            }
            else{
                this.filteredData=this.totalData.filter(eachObj=>{
                    
                        return eachObj[this.filterby].toLowerCase().includes(this.searchc)
                    
                 })
            }
            
        
        },1000)
        
     }
    }
}