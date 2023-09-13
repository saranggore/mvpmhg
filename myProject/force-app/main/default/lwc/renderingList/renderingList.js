import { LightningElement } from 'lwc';

export default class RenderingList extends LightningElement {
    contacts=[
       { id:1,
        name:"Mayur",
        title:"CEO"
       },
       { id:2,
        name:"Sujeet",
        title:"Director"
       },
       { id:3,
        name:"Sandeep",
        title:"Chairman"
       }
    ]
}