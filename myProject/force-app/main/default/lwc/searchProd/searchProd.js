import { LightningElement ,track,api,wire} from 'lwc';
import serachProds from '@salesforce/apex/SearchController.retriveProducts';
import createOpportunityProduct from '@salesforce/apex/SearchController.createOpportunityProduct';

const columns = [
    {
        label: 'Product Name',
        fieldName: 'Product2.Name',
        type: 'url',
        typeAttributes: {label: { fieldName: 'Product2.Name' }, target: '_blank'}
    }, {
        label: 'Product Code',
        fieldName: 'Product2.ProductCode',
        type: 'text',
    }, {
        label: 'List Price',
        fieldName: 'UnitPrice',
        type: 'text',
    }, 
    {
        label: 'Product Description',
        fieldName: 'Product2.Description',
        type: 'text',
    }, 
    {
        label: 'Product Family',
        fieldName: 'Product2.Family',
        type: 'text',
    }, 
    ];

    const cols = [
        {
            label: 'PriceBookEntryId',
            fieldName: 'PriceBookEntryId',
            type: 'text',
            
        },  {
            label: 'Product',
            fieldName: 'Name',
            type: 'text',
            
        }, {
            label: 'Quantity',
            fieldName: 'Quantity',
            type: 'text',
        }, {
            label: 'Sales Price',
            fieldName: 'SalesPrice',
            type: 'text',
        }, 
        
     ];
export default class SearchProd extends LightningElement {

    @track searchData;
    @track columns = columns;
    @track strSearchProdName;
    @track allContacts = [];
    @api pricebookidfromopp;
    @track allselectedData=[];
  //  @track columns = cols;
   // @track selectedRows;
    
            handleProductName(event) {
                
                this.strSearchProdName = event.detail.value;
                //serachProds({strProdName : this.strSearchProdName,priceBId:this.pricebookidfromopp})
                serachProds({strProdName:this.strSearchProdName,priceBId:this.pricebookidfromopp})
                .then(result => {
                this.searchData = result;
                console.log(result);
                if(result) {
                    //this is the final array into which the flattened response will be pushed. 
                    let contactsArray = [];
                     
                    for (let row of result) {
                         // this const stroes a single flattened row. 
                         const flattenedRow = {}
                         
                         // get keys of a single row — Name, Phone, LeadSource and etc
                         let rowKeys = Object.keys(row); 
                        
                         //iterate 
                         rowKeys.forEach((rowKey) => {
                             
                             //get the value of each key of a single row. John, 999-999-999, Web and etc
                             const singleNodeValue = row[rowKey];
                             
                             //check if the value is a node(object) or a string
                             if(singleNodeValue.constructor === Object){
                                 
                                 //if it's an object flatten it
                                 this._flatten(singleNodeValue, flattenedRow, rowKey)        
                             }else{
                                 
                                 //if it’s a normal string push it to the flattenedRow array
                                 flattenedRow[rowKey] = singleNodeValue;
                             }
                             
                         });
                        
                         //push all the flattened rows to the final array 
                         contactsArray.push(flattenedRow);
                     }
                    
                     //assign the array to an array that's used in the template file
                     this.allContacts = contactsArray;
                 } 
            })

           
        }
        _flatten = (nodeValue, flattenedRow, nodeName) => {        
            let rowKeys = Object.keys(nodeValue);
            rowKeys.forEach((key) => {
                let finalKey = nodeName + '.'+ key;
                flattenedRow[finalKey] = nodeValue[key];
            })
        }       

        handleRowSelection(event){
             var selectedRows=event.detail.selectedRows;
            console.log(selectedRows);
            //this.searchData=null;
            //const searchEvent=new CustomEvent("selectedProd",{detail:this.selectedRows});
            //this.dispatchEvent(searchEvent);
            var  oppProductList= [];
            
            for(var i in selectedRows){
                oppProductList.push({
                    //OpportunityId: '0062v00001UmOpfAAF',
                    PriceBookEntryId: selectedRows[i].Id,
                    Name:selectedRows[i]["Product2.Name"],
                    SalesPrice:selectedRows[i].UnitPrice,
                  Quantity:null,
                 // TotalPrice:null,
                
               });
             }
              console.log(oppProductList);
              this.allselectedData=oppProductList;
              console.log('allselectedData ',this.allselectedData)
          //    createOpportunityProduct({oppProduct: JSON.stringify(oppProductList)})
   //  .then((reponse) =>{
  //      console.log('Item inserted');
  //   })
 //    .catch((error) =>{
  //      console.error(error);
 //    }); 
        }
}