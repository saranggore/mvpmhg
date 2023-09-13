import { LightningElement } from 'lwc';

export default class Myapp extends LightningElement {
correctAnswers=0;
    questions=[
        {
            id :"Question1",
            que:'What is capital of Indai?',
            answers:{
                a:"Mumbai",
                b:"Delhi",
                c:"Bengluru"
            },
            correctAnswer:"b"
        },
        {
            id :"Question2",
            que:'What is capital of US?',
            answers:{
                a:"New york",
                b:"missiisipi",
                c:"Washington"
            },
            correctAnswer:"c"

        },
        {
            id :"Question3",
            que:'What is capital of Maharashtra?',
            answers:{
                a:"Pune",
                b:"Mumbai",
                c:"Bengluru"
            },
            correctAnswer:"b"
        }
    ];
    changeHandler(event){
const name=event.target.name;
console.log('Name------->',name);
const value=event.target.value;

console.log('Value------->',value);
//const {name,value}=event.target
this.selected={...this.selected,[name]:value}
console.log('selected------>',this.selected)

    }
    submitHandler(event){
event.preventDefault() 
let correct=this.questions.filter(item=>this.selected[item.id] === item.correctAnswer)
this.correctAnswers=correct.length
console.log("this.correctAnswers",this.correctAnswers)    }
}