import {api, LightningElement } from 'lwc';

export default class ChildCompdemo extends LightningElement {


   @api titile ="ChildComponent";

   @api ParentCompDemo()
   {
     this.titile ="ParentComponent";
   }
}