import { LightningElement,wire } from 'lwc';
import fetchDataRec from '@salesforce/apex/fetchData.fetchDataRec';

export default class FilterRecords extends LightningElement {
showContacts;
headings=["Id","Name","Email","Phone"];
fullTableData=[];
filteredData=[];
filterValue='Name';
    @wire(fetchDataRec)getcontactRecords({data,error}){
        if(data){
            console.log('Fetched Contacts',data);
            this.fullTableData=data;
            this.filteredData=data;
        }
        if(error){
            console.error('Error-->',error);
        }
    }

    get filterByOptions(){
        return [{label:"All",value:'All'},
                {label:"Id",value:'Id'},
                {label:"Name",value:'Name'},
                {label:"Email",value:'Email'},
                {label:"Phone",value:'Phone'},
               ]
    }
    filterByHandler(event){
        this.filterValue=event.target.value;
    }
    handleFilter(event){
     const {value}=event.target;
     console.log(value);
     this.filteredData=this.fullTableData.filter(eachObj=>{
       if(this.filterValue==='All'){
        return Object.keys(eachObj).some(key=>{
            return eachObj[key].toLowerCase().includes(value)
        })
       }
        else{
            const val=eachObj[this.filterValue]?eachObj[this.filterValue]:'';
            return val.toLowerCase().includes(value);
        }
     })
    }
}