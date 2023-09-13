import { LightningElement,api,wire } from 'lwc';
import chartjs from '@salesforce/resourceUrl/ChartJS';
import { loadScript } from 'lightning/platformResourceLoader';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'; 
import getOpportunities from  '@salesforce/apex/showRepor.runReport'; 
import getOpportunities2 from  '@salesforce/apex/showRepor.runReport2'; 
export default class FinalBar extends LightningElement {
    @api chartConfig;
    isChartJsInitialized;
     chartConfiguration;
    chartLabel = [];
    renderedCallback() {
        if (this.isChartJsInitialized) {
            return;
        }
        // load chartjs from the static resource
       
    }
   
    @wire(getOpportunities2)
    getOpportunities2({ error, data }) {
        if (error) {
            this.error = error;
            this.chartConfiguration = undefined;
        } else if (data) {
            var conts = data;
            data.forEach(opp => {
               this.chartLabel.push(opp);
            });
        }
    }
    @wire(getOpportunities)
    getOpportunities({ error, data }) {
        if (error) {
            this.error = error;
            this.chartConfiguration = undefined;
        } else if (data) {
            //console.log(data)
            let chartdata = [];
            let chartLabel =this.chartLabel;
            var conts = data;
            
            data.forEach(opp => {
                var ret = opp.slice(4);
                    console.log(ret);   
                    ret = ret.replace( /,/g, "" );
                    chartdata.push(ret);
            })
            console.log('chartdata',chartdata);
            this.chartConfiguration = {
                type: 'horizontalBar',
                data: {
                    datasets: [{
                        axis: 'y',
                        barPercentage: 0.5,
                        barThickness: 1,
                        label: 'Total Revenue',
                        //backgroundColor: "green",
                        backgroundColor: ["green","green","green","green","green"],
                        data: chartdata,
                    },
                    ],
                   labels: chartLabel,
                },
                options: {
                    indexAxis: 'y',
                    scales: {
                        xAxes: [{
                            barThickness: 8,  // number (pixels) or 'flex'
                            maxBarThickness: 10 // number (pixels)
                        }]
                    }
                },
            };
            var colorChangeValue = 4000; //set this to whatever is the deciding color change value
            var dataset = this.chartConfiguration.data.datasets[0];
            for (var i = 0; i < dataset.data.length; i++) {
            if (dataset.data[i] > colorChangeValue) {
                dataset.backgroundColor[i] = "red";
                console.log('Its red',i);
            }
            }
            chartConfiguration.update();
            console.log('data => ', data);
            this.error = undefined;
        }
        Promise.all([loadScript(this, chartjs)])
        .then(() => {
            this.isChartJsInitialized = true;
            const ctx = this.template.querySelector('canvas.barChart').getContext('2d');
            this.chart = new window.Chart(ctx, JSON.parse(JSON.stringify(this.chartConfiguration)));
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


}