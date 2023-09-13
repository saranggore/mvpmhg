import { LightningElement,track,wire } from 'lwc';
import prfileNames from '@salesforce/apex/futureExample.prfileNames';
export default class AssignPermissionSet extends LightningElement {
profileName='';
@track permissionsetName;
ShowNames
    handleProfileName(event){
     this.profileName= event.target.value;
     console.log(this.profileName);
                              }

 
 handlePermissionsetName(event){
     this.permissionsetName= event.target.value;
     console.log(this.permissionsetName);
    }   
    handleclick(){
      console.log('clciked');
      console.log(this.profileName);
      prfileNames({ searchKey: this.profileName })
            .then((result) => {
                this.ShowNames = result;
                this.error = undefined;
                console.log(this.ShowNames);
            })
            .catch((error) => {
                this.error = error;
                this.contacts = undefined;
            });
       

    }
    
}