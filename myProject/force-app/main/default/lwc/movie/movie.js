import { LightningElement,api,track } from 'lwc';

export default class Movie extends LightningElement {
    @track showData=false;
    @track showData2=false;
    MovieName;
    Year;
    Genere;
    @api movieData=[{Name:'Movie One',Year:'1991',Genere:'Horror'},{Name:'Movie Two',Year:'1992',Genere:'Comedy'}];
    handleChange(){
    this.showData=!this.showData;
    }
    handleit(event){
        this.showData2=true;
     var name=event.target.value;
     console.log(name);
     if(name=='Movie One'){
       this.MovieName=name;
       this.Year='1991';
       this.Genere='Horror';
     }
     if(name=='Movie Two'){
        this.MovieName=name;
        this.Year='1992';
        this.Genere='Comedy';
    }
    }

}