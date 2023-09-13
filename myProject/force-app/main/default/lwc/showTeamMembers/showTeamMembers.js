import { LightningElement,api, wire,track } from 'lwc';
import TeamMembers from '@salesforce/apex/accountTeam.teamMembers';

export default class ShowTeamMembers extends LightningElement {
    @api recordId;
    @track mapData= [];
    infoDisplay;
    @wire(TeamMembers,{accId:'$recordId'})
    teamRecords({data,error}){
        if(data)
        {
            var conts = data;
            for(var key in conts){
                this.mapData.push({value:conts[key], key:key});
            }  
            console.log(mapData);
        }
        else if (error) 
        {
            console.error(error);
        }
        
    }
}