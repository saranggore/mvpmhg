import { LightningElement,wire } from 'lwc';
import getOpportunities from  '@salesforce/apex/summary2.runReport'; 
import getReporId from  '@salesforce/apex/summary2.runReport3'; 
import {NavigationMixin} from 'lightning/navigation';
export default class SummaryCount extends NavigationMixin(LightningElement) {

    chartConfiguration;
    chartLabel = [];
    reportId;
    @wire(getOpportunities)
    getOpportunities({ error, data })
     {
        if (error) {
            this.error = error;
            this.chartConfiguration = undefined;
                   } 
        else if (data) {
            //console.log(data)
            let chartdata = [];
            let chartLabel =['Year Count','Last Month Count'];
            var conts = data;
            
            data.forEach(opp => {
                    chartdata.push(opp);
             })
            console.log('chartdata',chartdata);
            this.chartConfiguration = {
                type: 'bar',
                data: {
                    datasets: [{
                        axis: 'x',
                        barPercentage: 1,
                        barThickness: 2,
                        label: 'Total Count',
                        backgroundColor: "green",
                        //backgroundColor: ["green","green"],
                        data: chartdata,
                    },],
                   labels: chartLabel,
                },
                options: {
                    scales: {
                        xAxes: [{
                                  barThickness: 20,  // number (pixels) or 'flex'
                                  // maxBarThickness: 12 // number (pixels)
                               }],
                        yAxes: [{
                            ticks: {
                                     beginAtZero: true
                                   }
                               }]
                            },
                    //onClick:this.graphClickEvent,  
                    onClick: (...params) => this.graphClickEvent(...params)
                    }
                
               
            };
           
            console.log('data => ', data);
            this.error = undefined;
        }
    }

    @wire(getReporId)getIdd({data,error})
    {
        if(data){
                console.log('Report Id:'+data);
                this.reportId=data;
                }
    }
      graphClickEvent(){
        console.log('clicked');
        console.log('Event Logged, parameters: ');
       
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId:this.reportId,
                objectApiName: 'Report',
                actionName: 'view'
            }
        });
    } 
}