import { track,LightningElement } from 'lwc';
import {ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class VariableExample extends LightningElement {
 Title = "HCL tech DEMO";

 connectedCallback() {
   let collmyfuction = this.myfuctiom(10,5);
   console.log('arrow functionn example'+collmyfuction)
    const name = 'example';
    let letname = '';
    var varname ='';
     if(this.Title){
        //window.alert('const example'+name);
     }

 }

 ShowDemo()
 {
   this.showtosteventFunction(this.Title);
 }

 showtosteventFunction(titleevent)
 {
   const event =new  ShowToastEvent({
      title : titleevent,
      message : 'showmassage',
      variant :'success',

   })
   this.dispatchEvent(event);
 }

 myfuctiom = (divident , diviser) =>{

   return (divident/diviser)
 }
//------------------------------------------------Track example-----------------------------------
@track Fieldvalue ={firtname : "" ,Lastname :""}
 Getdata(event)
  {
   const fieldname =event.target.name;
   if(fieldname === 'FirstName')
   {
      this.Fieldvalue.firtname = event.target.value;
   }
   else if(fieldname ==='LastName')
   {
       this.Fieldvalue.Lastname = event.target.value;

   }
  }

  

}