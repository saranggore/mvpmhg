import { LightningElement, api } from 'lwc';
import chartjs from '@salesforce/resourceUrl/ChartJS';
import { loadScript } from 'lightning/platformResourceLoader';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'; 
import {NavigationMixin} from 'lightning/navigation';
import { clone } from './utils';
export default class childbarchart extends LightningElement {
    @api chartConfig; 
    isChartJsInitialized;
    renderedCallback() {
        if (this.isChartJsInitialized) {
            return;
        }
        // load chartjs from the static resource
        Promise.all([loadScript(this, chartjs)])
        .then(() => {
            this.isChartJsInitialized = true;
            const ctx = this.template.querySelector('canvas.barChart').getContext('2d');
         //  this.chart = new window.Chart(ctx, JSON.parse(JSON.stringify(this.chartConfig)));
           //chartcon=this.clone(this.chartConfig);
           console.log(JSON.stringify(this.chartConfig));
          this.chart = new window.Chart(ctx, clone(this.chartConfig));
            if(ctx.onclick){
                ctx.onclick=this.handleClick();
            }
          
        })
        .catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error loading Chart',
                    message: error.message,
                    variant: 'error',
                })
            );
        });
    }
   handleClick()
    {
        //console.log(' I am clicked');
    }
   /* graphClickEvent(){
        console.log('i got clicked');
    } */
     
      
}