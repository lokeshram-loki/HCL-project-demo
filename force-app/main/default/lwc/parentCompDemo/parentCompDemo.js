import { LightningElement } from 'lwc';

export default class ParentCompDemo extends LightningElement {


ChangeValue()
{
 this.template.querySelector("c-child-compdemo").ParentCompDemo();
}
   

}