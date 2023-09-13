import { LightningElement } from 'lwc';
const bookurl='https://www.googleapis.com/books/v1/volumes?q=';
export default class BookApp extends LightningElement {
query='US';
books=[];
timer;
connectedCallback(){
    this.fetchbookdata();
}


fetchbookdata(){

    fetch(bookurl+this.query)
    .then(response=>response.json())
    .then(data=>{
        console.log(data)
        this.books=data ? this.formatData(data) :[]
       
    })
    .catch(error=>console.error(error))
}

searchBook(event){
    this.query=event.target.value;
   // this.fetchbookdata();
    window.clearTimeout(this.timer)
    this.timer=setTimeout(()=>{
        this.fetchbookdata()
    },1000)
}

formatData(data){
    console.log(data)
    let books =  data.items.map(item=>{
        let id = item.id
        let thumbnail = item.volumeInfo.imageLinks && (item.volumeInfo.imageLinks.smallThumbnail || item.volumeInfo.imageLinks.thumbnail)
        let title = item.volumeInfo.title
        let publishedDate = item.volumeInfo.publishedDate
        let pageCount = item.volumeInfo.pageCount 
        return {id, thumbnail, title, publishedDate, pageCount}

    })
    return books
}
}